/*const SerialPort = require('serialport');
const Readline = SerialPort.parsers.Readline;
const parser = new Readline();

const mySerial = new SerialPort('COM4',{
  baudRate : 9600
});

mySerial.on('open',function(){
  console.log('Opened serial port');
});

mySerial.on('data', function(data){
  console.log(data.toString());
});

mySerial.on('err', function(err){
  console.log(err.message);
});*/
const SerialPort = require('serialport');
const express = require('express');
const socketIo = require('socket.io');

const http = require('http');
const path = require('path');

const app = express();
const server = http.createServer(app);
const io = socketIo.listen(server);

const Readline = SerialPort.parsers.Readline;
const parser = new Readline();

const mySerial = new SerialPort('COM3', {
  baudRate: 9600
});

io.on('connection', function(socket){
  console.log('a new socket connected');
})

app.get('/', (req, res) => {
  res.sendFile(__dirname +'/index.html');
});

// static files
app.use(express.static(path.join(__dirname, 'public')));

mySerial.on('open', function () {
  console.log('Opened Port.');
});

mySerial.on('data', function (data) {
  console.log(data.toString());
  io.emit('arduino:data', {
    value: data.toString()
  });
});

mySerial.on('err', function (data) {
  console.log(err.message);
});

server.listen(3000, () => {
  console.log('Server on port 3000');
});
