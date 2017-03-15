console.log("connected");

var counter = 1;
var limit = 10;
function addInput(divName){
     if (counter == limit)  {
          alert("You have reached the limit of adding " + counter + " inputs");
     }
     else {
          var newdiv = document.createElement('div');
          newdiv.innerHTML = '<div class = "education" id="dynamicInput"><input type="hidden" name="user_id" value= "<%= session[:id] %>" ><label>school</label><input type="text" name="school" ><label>certification</label><input type="text" name="certification" ><label>completed in</label><input type="text" name="year" ></div>';

          document.getElementById(divName).appendChild(newdiv);
          counter++;
     }
}

function removeInput(divName) {


}
