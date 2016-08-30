CoffeePubSub - CoffeeScript/Javascript Publish Subscribe Library
======================================================





<code> /build/dest/cpubsub.min.js </code> - load with  <code> requirejs </code> or directly in a <code> script </code> tag

<code> /build/dest/cpubsub.coffee </code> - CoffeeScript source code


<hr/>



<h4>*Prerequisites </h4>

<ul>
    <li><code>npm</code> - nodejs package manager (comes with the installation of nodejs)</li>
    <li><code>coofee-script</code> <code> npm install -g coffee-script</code> </li>
    <li><code>grunt</code> - javascript task runner<code> npm install -g grunt-cli</code> </li>
    <li><code>bower</code> - web package manager <code> npm install -g bower </code></li>
</ul>


<hr/>

<h4>To build the project independently the following steps are required : </h4>

<ul>
    <li> install the following grunt plugins

     <div>
         <ul>
               <li><code> npm install grunt --save-dev </code></li>
	       <li><code> npm install grunt-contrib-coffee --save-dev </code></li>	
               <li><code> npm install grunt-contrib-copy --save-dev </code></li>
               <li><code> npm install grunt-contrib-uglify --save-dev </code></li>
         </ul>
    </div>
</li>

    <li>


           <ul>
                 <li>
                     <div> get the dependencies with bower - jasmine, require </div>
                 </li>

                <li>
                    <div> run <code> bower install </code> </div>
                </li>
           </ul>
     </li>



    <li>run <code> grunt default </code> and the build can be found in <code> /build/dest/  </code>  </li>
    <li>coffee files are compiled with <code> grunt default</code>(compile task)</li>
    <li>for development or to run the tests start server(ex: <code> python -m http.server</code>) in folder <code> /build/coffee-pub-sub/  </code>  </li>
    
    <!--
         default: coffee files are compiled with <code> grunt default</code>
    
         call coffee directly to compile files
    
         cd main
    
         $coffee -o ./ -bcw ./main.coffee
         $coffee -o ./core/ -cbw ./src/
         $coffee -o ./specs/js/ -cbw specs/coffee/
    -->
</ul>


<h4>Examples: </h4>


The library supports 2 ways to publish events :

<ul>
    <li>the <code>on - trigger</code> way with a little tweaked (presented below)</li>
    <li>attaching callbacks to the function properties of object which is achieved by wrapping the original object (Ex: o -> see below) in a proxy that handles the properties calls </li>
</ul>


<h3> the 'on - trigger' way </h3>
<code>  myobj.trigger(event, params)  </code> event - to trigger, params - parameters sent to the callback function

<code>  myobj.trigger()  </code>  called without any parameters the trigger function will return the list of all published callbacks

<code> 

        var o, cpubsub;
              o = {
                aprop: 'aprop',
                bprop: 'bprop',
                cprop: function(param) {
                  return param;
                },
                dprop: 'dprop',
                eprop: function(param) {
                  return param;
                },
                sendMessage: function(param) {
                  var message = 'the message is : ' + param;
                  return message;
                }
              };
              myobj = new cpubsub(o);
              
              myobj.on('ring', function(param) {
                var ring = 'ring ! ring ! the ' + param;
                console.log(ring);
                return ring;
              });
              
              myobj.on('update', function() {
                console.log('update'); 
              });
              
              var bell = 'bell';  /the parameter of ring event
              
              var ringSound = myobj.trigger('ring', bell);
                
              console.log(ringSound); 


</code>


<h3> attaching callbacks to the function properties of object </h3>

<code>myobj.attachTo(methodName, callback, priority ) </code> methodName - the name of the method to which is attached the callback , callback - the function attached, priority - order of execution (is optional)

<code>

     myobj.attachTo('sendMessage', function() {
        console.log('do something here with the properties of the myobj');
      }, 1);

</code>


<h3> To remove an event use <code> off() </code> method </h3>


<code>  myobj.off('update');</code> returns true or false








