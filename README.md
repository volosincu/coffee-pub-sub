CoffeePubSub - CoffeeScript/Javascript Publish Subscribe Library
======================================================





<code> CoffeePubSub/build/dest/proto.min.js </code> - load with  <code> requirejs </code> or directly in a <code> script </code> tag

<code> CoffeePubSub/build/dest/proto.coffee </code> - CoffeeScript source code



To build the project independently the following steps are required :

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



    <li>run <code> grunt default </code> and the build can be found in <code> build/CoffeePubSub/  </code>  </li>
</ul>



