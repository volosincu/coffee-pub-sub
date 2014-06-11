CoffeePubSub - CoffeeScript/Javascript Publish Subscribe Library
======================================================





<code> /build/dest/publisher.min.js </code> - load with  <code> requirejs </code> or directly in a <code> script </code> tag

<code> /build/dest/publisher.coffee </code> - CoffeeScript source code


<hr/>



<h4>*Prerequisites </h4>

<ul>
    <li><code>npm</code> - nodejs package manager (comes with the installation of nodejs)</li>
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
               <li><code> npm install grunt-contrib-copy --save-dev </code></li>
               <li><code> npm install grunt-contrib-uglify --save-dev </code></li>
               <li><code> npm install grunt-sync --save-dev </code></li>
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



    <li>run <code> grunt default </code> and the build can be found in <code> /build/CoffeePubSub/  </code>  </li>
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

        var o, publisher;
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
              myobj = new Publisher(o);
              
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

<code>

     myobj.attachTo('eprop', function() {
        console.log("subscriber 1");
        this.order_of_dprop_subscribers.push(1);
      }, 1);

</code>



<hr/>




