/*
1. Use a constructor function to implement an Electric Car (called 'EV') as a child
"class" of 'Car'. Besides a make and current speed, the 'EV' also has the current battery charge in % ('charge' property)
2. Implement a 'chargeBattery' method which takes an argument 'chargeTo' and sets the battery charge to 'chargeTo' 
3. Implement an 'accelerate' method that will increase the car's speed by 20, and decrease the charge by 1%. Then log a message like this: 'Tesla going at 140 km/h, with a charge of 22%'
4. Create an electric car object and experiment with calling 'accelerate', 'brake' and 'chargeBattery' (charge to 90%). Notice what happens when you 'accelerate'! Hint: Review the definiton of polymorphism 😉

Test data:
§ Data car 1: 'Tesla' going at 120 km/h, with a charge of 23%
*/

let Car = function (make, currentSpeed) {
  this.make = make;
  this.speed = currentSpeed;

  this.accelerate = function () {
    this.speed = this.speed + 20;
    this.charge = this.charge - 1;
    console.log(
      `${this.make} going at ${this.speed} km/h, with a charge of ${this.charge}%`
    );
  };

  this.brake = function () {
    this.speed = this.speed - 5;
    console.log(`Loss  :  ${this.speed}`);
  };
};

let EV = function (make, speed, charge) {
  Car.call(this, make, speed);
  this.charge = charge;

  chargeBattery = function (chargeTo) {
    this.charge = chargeTo;
  };
};

EV.prototype = Object.create(Car.prototype);

const BMW = new EV("BMW", 120);
const Lambo = new Car("Mercedes", 95);

console.log(BMW);
console.log(BMW.accelerate());
