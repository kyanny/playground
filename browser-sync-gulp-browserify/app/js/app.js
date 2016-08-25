// let app = 'awesome';

// class MyClass {
//     constructor() {
//         this.name = "Kensuke";
//     }
//     sayHello() {
//         console.log(`Hello, ${this.name}!`);
//     }
// }

function() {
  
}

function() 

// var me = new MyClass();
// me.sayHello();

// var f = () => console.log("good");
// f();

$(() => {
  console.log('ready');

  var server = sinon.fakeServer.create();
  server.respondWith('GET', '/ok', [200, {'Content-Type':'application/json'}, '{"OK":true}']);
  $.get('/ok').done(function (data) {
    console.log(data);
  });
  console.log('aaa');
  $.get('/ok').done(function (data) {
    console.log(data);
  });
  console.log('aaa');
  server.respond();
  console.log(server);

  var server = sinon.fakeServer.create();
  server.respondWith('GET', '/ok', [200, {'Content-Type':'application/json'}, '{"OK":false}']);
  $.get('/ok').done(function (data) {
    console.log(data);
  });
  console.log('bbb');
  server.respond();
  console.log(server);

});

// $(function () {
//   console.log('ready');

//   var server = sinon.fakeServer.create();
//   server.respondWith('GET', '/ok', [200, {'Content-Type':'application/json'}, '{"OK":true}']);
//   $.get('/ok').done(function (data) {
//     console.log(data);
//   });
//   console.log('aaa');
//   server.respond();
//   console.log(server);

//   server.respondWith('GET', '/ok', [200, {'Content-Type':'application/json'}, '{"OK":false}']);
//   $.get('/ok').done(function (data) {
//     console.log(data);
//   });
//   console.log('bbb');
//   server.respond();
//   console.log(server);
// });


