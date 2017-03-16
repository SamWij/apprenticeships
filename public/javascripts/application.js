console.log("connected");

var counter = 1;
var limit = 10;
function addEducation(){

  var uniqueid = 1
     if (counter == limit)  {
          alert("You have reached the limit of adding " + counter + " inputs");
     }
     else {

       uniqueid++

        $('.education-section').append('<div>').addClass( "form-group form-education" );
        $('.form-education').append("<label class='col-md-6 control-label'>school</label>")
        $('.form-education').append("<input type='hidden' name='education_id' value= '<%= session[:id] %>' >")
        $('.form-education').append("<input type='text' name='schools[uniqueid]' class='form-control input-md'>")
        $('.form-education').append("<label class='col-md-6 control-label'>certification</label>")
        $('.form-education').append("<input type='text' name='certification['uniqueid'] class= 'form-control input-md'>")
        $('.form-education').append("<label class='col-md-6 control-label'>completion year</label>")
        $('.form-education').append("<input type='text' name='year['uniqueid'] class='form-control input-md'>")

        console.log(uniqueid)

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
