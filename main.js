const balance = document.getElementById("balance");
const inflow = document.getElementById("income");
const outflow = document.getElementById("expense");
const list = document.getElementById("list");
const form = document.getElementById("form");
const text = document.getElementById("text");
const amount = document.getElementById("amount");

// Transacciones en almacenamiento local
const localStorageTransactions = JSON.parse(
    localStorage.getItem("transactions")
);

let transactions =
    localStorage.getItem("transactions") !== null ? localStorageTransactions : [];

// Agregar transacciones
function addTransaction(e) {
    e.preventDefault();

    if (text.value.trim() === "" || amount.value.trim() === "") {
        document.getElementById("error_msg").innerHTML =
            "<span >Error: Favor ingresar la descripción y la cantidad</span>";
        setTimeout(
            () => (document.getElementById("error_msg").innerHTML = ""),
            5000
        );
    } else {
        const transaction = {
            id: generateID(),
            text: text.value,
            amount: +amount.value,
        };

        transactions.push(transaction);

        addTransactionDOM(transaction);

        updateValues();

        updateLocalStorage();

        text.value = "";
        amount.value = "";
    }
}

// Generar un ID aleatorio
function generateID() {
    return Math.floor(Math.random() * 100000000);
}

// Historial de transacciones
function addTransactionDOM(transaction) {
    // Get sign
    const sign = transaction.amount < 0 ? "-" : "+";

    const item = document.createElement("li");

    // Agrregar la clase basada en el valor
    item.classList.add(transaction.amount < 0 ? "minus" : "plus");

    item.innerHTML = `
    ${transaction.text} ${sign}${Math.abs(
        transaction.amount
    )} <button class="delete-btn" onclick="removeTransaction(${transaction.id
        })">X</button>
  `;

    list.appendChild(item);
}

// Actualizar el balance, Balanace de Ingreso and Balance de Egreso
function updateValues() {
    const amounts = transactions.map((transaction) => transaction.amount);

    const total = amounts.reduce((bal, value) => (bal += value), 0).toFixed(2);

    const income = amounts
        .filter((value) => value > 0)
        .reduce((bal, value) => (bal += value), 0)
        .toFixed(2);

    const expense =
        amounts
            .filter((value) => value < 0)
            .reduce((bal, value) => (bal += value), 0) * -(1).toFixed(2);

    balance.innerText = `$${total}`;
    inflow.innerText = `$${income}`;
    outflow.innerText = `$${expense}`;
}

// Remover transacciones por ID
function removeTransaction(id) {
    transactions = transactions.filter((transaction) => transaction.id !== id);

    updateLocalStorage();

    start();
}

// actualizar el almacenamiento local
function updateLocalStorage() {
    localStorage.setItem("transactions", JSON.stringify(transactions));
}

// Iniciar 
function start() {
    list.innerHTML = "";
    transactions.forEach(addTransactionDOM);
    updateValues();
}

start();

form.addEventListener("submit", addTransaction);

