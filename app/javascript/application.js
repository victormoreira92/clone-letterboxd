// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"


// Tabulator
import {Tabulator} from 'tabulator-tables';
window.Tabulator = new Tabulator()

var table = new Tabulator("#example-table", {
  height:205, // set height of table (in CSS or here), this enables the Virtual DOM and improves render speed dramatically (can be any valid css height value)
  ajaxURL:'/user.json', //assign data to table
  layout:"fitColumns", //fit columns to width of table (optional)
  columns:[ //Define Table Columns
      {title:"Username", field:"username", width:150},
      {title:"Email", field:"email"},
      {title:"Disable At", field:"disable_at"},
      {title:"Created At", field:"created_at"},
      {title:"Actions", field: "id" }

  ],
});

//trigger an alert message when the row is clicked
table.on("rowClick", function(e, row){
  alert("Row " + row.getData().id + " Clicked!!!!");
});

console.log(table.setData("/user.json"));