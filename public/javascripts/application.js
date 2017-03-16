console.log("connected");

var counter = 1;
var limit = 10;
function addEducation(divName){
     if (counter == limit)  {
          alert("You have reached the limit of adding " + counter + " inputs");
     }
     else {
          var newdiv = document.createElement('div');
          newdiv.innerHTML = '<div class = "education" id="education"><div class="form-group"><label class="col-md-6 control-label">school</label><input type="hidden" name="education_id" value= "<%= session[:id] %>"><input type="text" name="school" class="form-control input-md"><label class="col-md-6 control-label">certification</label><input type="text" name="certification" class="form-control input-md"><label class="col-md-6 control-label">completed in</label><input type="text" name="year" class="form-control input-md"></div></div></div>';

          document.getElementById(divName).appendChild(newdiv);
          counter++;
     }
}


function addWorkExperience(divName){
     if (counter == limit)  {
          alert("You have reached the limit of adding " + counter + " inputs");
     }
     else {
          var newdiv = document.createElement('div');
          newdiv.innerHTML = '';

          document.getElementById(divName).appendChild(newdiv);
          counter++;
     }
}

function addLicenses(divName){
     if (counter == limit)  {
          alert("You have reached the limit of adding " + counter + " inputs");
     }
     else {
          var newdiv = document.createElement('div');
          newdiv.innerHTML = '';

          document.getElementById(divName).appendChild(newdiv);
          counter++;
     }
}

function addReferences(divName){
     if (counter == limit)  {
          alert("You have reached the limit of adding " + counter + " inputs");
     }
     else {
          var newdiv = document.createElement('div');
          references.innerHTML = '';

          document.getElementById(divName).appendChild(newdiv);
          counter++;
     }
}
