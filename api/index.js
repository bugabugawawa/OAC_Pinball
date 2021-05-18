const express = require('express');
const fs = require('fs');
const app = express();
const PORT = 8080;

app.use(express.json());

app.listen(
  PORT,
  () => console.log("UP")
  )

app.get('/input', (req, res) => {
  res.status(200).send({
    string: 'lol'
  })
});

app.post('/input/:id', (req, res) =>{
  const { id } = req.params;
  
// Write data in 'Output.txt' . 
fs.writeFile('inputs.txt', id , (err) => { 
      
  // In case of a error throw err. 
  if (err) throw err; 
})

  res.send({
    id: `input received: ${id}`,
  })

})
