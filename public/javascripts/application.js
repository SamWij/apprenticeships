console.log("connected");

var uniqueid = 1;
var limit = 10;
function addEducation(){


     if (uniqueid == limit)  {
          alert("You have reached the limit of adding " + limit + " inputs");
     }
     else {

       uniqueid++

        $('.education-section').append('<div>').addClass( "form-group form-education" );
        $('.form-education').append("<label class='col-md-6 control-label school'>school</label>")
        $('.school').append("<input class 'hidden' type='hidden' name='education_id' value= '<%= session[:id] %>' >")
        $('.hidden').append("<input type='text' name='schools[uniqueid]' class='form-control input-md school-input'>")
        $('.school-input').append("<label class='col-md-6 control-label' class = 'cert'>certification</label>")
        $('.cert').append("<input type='text' name='certification['uniqueid'] class= 'form-control input-md cert-input'>")
        $('.cert-input').append("<label class='col-md-6 control-label year'>completion year</label>")
        $('.year').append("<input type='text' name='year['uniqueid'] class='form-control input-md'>")

        console.log(uniqueid)


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
