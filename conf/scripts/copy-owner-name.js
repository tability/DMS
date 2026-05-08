// copy-owner-name.js
(function() {
   try {
      // отримуємо асоціацію "mcp:owner"
      var ownerAssoc = document.assocs["mcp:owner"];
      if (ownerAssoc != null && ownerAssoc.length > 0) {
         var ownerNode = ownerAssoc[0];
         var fullName = ownerNode.properties["emp:fullName"];
         
         if (fullName != null && fullName != "") {
            // записуємо ПІБ у властивість mcp:ownerName
            document.properties["mcp:ownerName"] = fullName;
            document.save();
         }
      }
   } catch (e) {
      logger.log("Error in copy-owner-name.js: " + e);
   }
})();
