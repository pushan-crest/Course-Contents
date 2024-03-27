'use strict';

const btn = document.querySelector('.btn-country');
const countriesContainer = document.querySelector('.countries');

const renderCountry = function (data) {
  // let data = getJSON(`https://restcountries.com/v3.1/name/${country}`);
  console.log(data);

  const html = `
  <article class="country">
          <img class="country__img" src="${data.flags.png}" />
          <div class="country__data">
            <h3 class="country__name">${data.name.common}</h3>
            <h4 class="country__region">${data.region}</h4>
            <p class="country__row"><span>👫</span>${(
              +data.population / 1000000
            ).toFixed(2)}M people</p>
            <p class="country__row"><span>🗣️</span>${
              Object.keys(data.languages)[0]
            }</p>
            <p class="country__row"><span>💰</span>${
              Object.keys(data.currencies)[0]
            }</p>
          </div>
        </article>
  `;
  countriesContainer.insertAdjacentHTML('beforeend', html);
  countriesContainer.style.opacity = 1;
};

const renderError = function (msg) {
  countriesContainer.insertAdjacentText('beforeend', msg);
  countriesContainer.style.opacity = 1;
};

const getJSON = function (country, errorMsg = 'Something went wrong') {
  let url = `https://restcountries.com/v3.1/name/${country}`;
  return fetch(url)
    .then(response => {
      if (!response.ok) throw new Error(`${errorMsg} (${response.status})`);

      return response.json();
    })
    .then(data => {
      renderCountry(data[1]);
      const neighbour = data[1].borders[0];
      if (!neighbour) return;

      return fetch(`https://restcountries.com/v3.1/alpha/${neighbour}`);
    })
    .then(response => response.json())
    .then(data => {
      renderCountry(data[0]);
    });
};

// getJSON('india');

// ===================================

//  Extras

function printingResult(data) {
  if (!data.region) {
    console.log('Data not found');
    return;
  }
  getJSON(data.country);
}

let findCountry = function (lat, lng) {
  let loc = fetch(
    `https://geocode.xyz/${lat},${lng}?geoit=json&auth=320188571060459241957x9743`
  )
    .then(response => {
      if (!response.ok) throw Error('Not recheable');
      return response.json();
    })
    .then(data => {
      printingResult(data);
    })
    .catch(e => {
      console.log(e.message);
    });
};

// whereAmI(21.1843631, 72.7924497);
// whereAmI(41.1843631, 72.7924497);
// whereAmI(81.1843631, 72.7924497);
// whereAmI(52.508, 13.381);

navigator.geolocation.getCurrentPosition(
  pos => {
    findCountry(pos.coords.latitude, pos.coords.longitude);
  },
  err => {
    return console.log(err.message);
  }
);
