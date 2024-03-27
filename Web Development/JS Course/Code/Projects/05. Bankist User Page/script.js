"use strict";

// ====================================================

const account1 = {
  owner: "Jonas Schmedtmann",
  transactions: [200, 455.23, -306.5, 25000, -642.21, -133.9, 79.97, 1300],
  interestRate: 1.2, // %
  pin: 1111,

  movementsDates: [
    "2019-11-18T21:31:17.178Z",
    "2019-12-23T07:42:02.383Z",
    "2020-01-28T09:15:04.904Z",
    "2020-04-01T10:17:24.185Z",
    "2020-05-08T14:11:59.604Z",
    "2020-07-26T17:01:17.194Z",
    "2020-07-28T23:36:17.929Z",
    "2020-08-01T10:51:36.790Z",
  ],
  currency: "EUR",
  locale: "pt-PT", // de-DE
};

const account2 = {
  owner: "Jessica Davis",
  transactions: [5000, 3400, -150, -790, -3210, -1000, 8500, -30],
  interestRate: 1.5,
  pin: 2222,

  movementsDates: [
    "2019-11-01T13:15:33.035Z",
    "2019-11-30T09:48:16.867Z",
    "2019-12-25T06:04:23.907Z",
    "2020-01-25T14:18:46.235Z",
    "2020-02-05T16:33:06.386Z",
    "2020-04-10T14:43:26.374Z",
    "2020-06-25T18:49:59.371Z",
    "2020-07-26T12:01:20.894Z",
  ],
  currency: "USD",
  locale: "en-US",
};

const accounts = [account1, account2];

// ==============================================================

const labelWelcome = document.querySelector(".welcome");
const labelDate = document.querySelector(".date");
const labelBalance = document.querySelector(".balance__value");
const labelSumIn = document.querySelector(".summary__value--in");
const labelSumOut = document.querySelector(".summary__value--out");
const labelSumInterest = document.querySelector(".summary__value--interest");
const labelTimer = document.querySelector(".timer");

const containerApp = document.querySelector(".app");
const containerMovements = document.querySelector(".movements");

const btnLogin = document.querySelector(".login__btn");
const btnTransfer = document.querySelector(".form__btn--transfer");
const btnLoan = document.querySelector(".form__btn--loan");
const btnClose = document.querySelector(".form__btn--close");
const btnSort = document.querySelector(".btn--sort");

const inputLoginUsername = document.querySelector(".login__input--user");
const inputLoginPin = document.querySelector(".login__input--pin");
const inputTransferTo = document.querySelector(".form__input--to");
const inputTransferAmount = document.querySelector(".form__input--amount");
const inputLoanAmount = document.querySelector(".form__input--loan-amount");
const inputCloseUsername = document.querySelector(".form__input--user");
const inputClosePin = document.querySelector(".form__input--pin");

// ===================================================================

// Implementing showTransaction
function showTransactions(acc, sort = false) {
  const trans = sort
    ? acc.transactions.slice().sort((a, b) => a - b)
    : acc.transactions;
  console.log(acc.transactions);
  containerMovements.innerHTML = "";
  trans.forEach((transaction, i) => {
    let type = transaction >= 0 ? `deposit` : `withdrawal`;
    let date = new Date(acc.movementsDates[i]);
    let html = `<div class="movements__row">
    <div class="movements__type movements__type--${type}">${
      i + 1
    } ${type} deposit</div>
    <div class="movements__date">${date.toLocaleString(acc.locale)}</div>
    <div class="movements__value">${transaction}€</div>
  </div>`;

    containerMovements.insertAdjacentHTML("afterbegin", html);
  });
}

// ===================================================================

// Implementing Username
function usrname(accounts) {
  accounts.forEach((acc) => {
    acc.username = acc.owner.toLowerCase().trim().split(" ");
    let result = "";
    for (const i of acc.username) {
      result += i[0];
    }
    acc.username = result;
  });
}
usrname(accounts);

// ===================================================================

// Implementing Current balance
function currentBalance(account) {
  account.balance = account.transactions.reduce((sum, val) => {
    return sum + val;
  }, 0);
  labelBalance.innerHTML = account.balance + `€`;
}

// ===================================================================

//  Implemetning the summery Section with total of all
function totalDisplay(accounts) {
  // Implementing the positive / Credits
  let credits = accounts.transactions
    .filter((val) => {
      return val >= 0;
    })
    .reduce((sum, val) => {
      return sum + val;
    });
  labelSumIn.innerHTML = credits;

  // Implementing the Negatives / Debits
  let debits = accounts.transactions
    .filter((val) => {
      return val < 0;
    })
    .reduce((sum, val) => {
      return sum + val;
    });
  labelSumOut.innerHTML = Math.abs(debits).toFixed(2);

  // Implementing the interest
  let interest = accounts.transactions
    .filter((val) => {
      return val >= 0;
    })
    .map((v) => {
      return Math.floor(v * accounts.interestRate) / 100;
    })
    .filter((e, i, arr) => {
      return e >= 1;
    })
    .reduce((sum, v) => {
      return sum + v;
    });
  labelSumInterest.innerHTML = Math.floor(interest);
}

// ===================================================================

// Handling the Login
let currentAccount, timer;

let now = new Date();

btnLogin.addEventListener("click", login);

function login(e) {
  // prevents form from submitting
  e.preventDefault();

  currentAccount = accounts.find((acc) => {
    return acc.username === inputLoginUsername.value;
  });

  labelDate.innerHTML = now.toLocaleString(currentAccount.locale);
  if (currentAccount?.pin === Number(inputLoginPin.value)) {
    // Display UI
    containerApp.style.opacity = 100;

    if (timer) clearInterval(timer);
    timer = logoutTimer();

    // Display Message
    labelWelcome.innerHTML = `Welcome back, ${
      currentAccount.owner.split(" ")[0]
    }`;

    //  Clear Input Fields
    inputLoginUsername.value = inputLoginPin.value = "";
    inputLoginPin.blur();
    inputLoginUsername.blur();

    // Show Transactions
    // Display Balance
    // Display Summery
    updateUI(currentAccount);
  }
}

// ===================================================================

//  Implementing Transfers
btnTransfer.addEventListener("click", transfer);

function transfer(e) {
  e.preventDefault();
  const amount = Number(inputTransferAmount.value);
  const receivcerObject = accounts.find((acc) => {
    return acc.username === inputTransferTo.value;
  });

  //  Clear inoput fields
  inputTransferAmount.value = inputTransferTo.value = "";

  // Deduct amount from current user
  if (
    amount > 0 &&
    receivcerObject &&
    amount < currentAccount.balance &&
    receivcerObject.username !== currentAccount.username
  ) {
    console.log("transfer valid");
    currentAccount.transactions.push(amount * -1);
    currentAccount.movementsDates.push(new Date());
  }

  // Update entry in
  receivcerObject.transactions.push(amount);
  receivcerObject.movementsDates.push(new Date());

  updateUI(currentAccount);
  console.log(accounts);

  // Clear Timer
  clearInterval(timer);
  timer = logoutTimer();
}

// ===================================================================

// General Function to  update the UI
function updateUI(acc) {
  showTransactions(acc);
  currentBalance(acc);
  totalDisplay(acc);
}

// ===================================================================

// Closing the Account
btnClose.addEventListener("click", closeAccount);

function closeAccount(e) {
  e.preventDefault();
  let deleteaccount = inputCloseUsername.value;
  let deleteaccountpin = inputClosePin.value;

  if (
    currentAccount.username === deleteaccount &&
    currentAccount.pin === Number(deleteaccountpin)
  ) {
    const index = accounts.findIndex((acc) => {
      return acc.username === currentAccount.username;
    });
    console.log(index);
    console.log(accounts.splice(index, 1));

    // Hide the UI
    containerApp.style.opacity = 0;
  }
  inputCloseUsername.value = inputClosePin.value = "";
}

// ===================================================================

// Loan Functionality
btnLoan.addEventListener("click", function (e) {
  e.preventDefault();

  const amount = Number(inputLoanAmount.value);

  if (
    amount > 0 &&
    currentAccount.transactions.some((mov) => mov >= amount * 0.1)
  ) {
    // Add movement
    currentAccount.transactions.push(amount);
    currentAccount.movementsDates.push(new Date());

    // Update UI
    updateUI(currentAccount);

    // Clear Timer
    clearInterval(timer);
    timer = logoutTimer();
  }
  inputLoanAmount.value = "";
});

// ===================================================================

// Sorting
let sorted = false;
btnSort.addEventListener("click", function (e) {
  e.preventDefault();
  showTransactions(currentAccount, !sorted);
  sortesd = !sorted;
});

// ===================================================================

let timeout = 50;

function logoutTimer() {
  let time = timeout;
  let tick = function () {
    labelTimer.textContent = `${Math.floor(time / 60)}:${time % 60}`;
    if (time == 0) {
      clearInterval(timer);
      containerApp.style.opacity = 0;
      labelWelcome.textContent = "Login to get started";
    }
    time = time - 1;
  };
  tick();
  let timer = setInterval(tick, 1000);
  return timer;
}
