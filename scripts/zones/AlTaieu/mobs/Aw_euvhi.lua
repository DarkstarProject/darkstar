-----------------------------------
-- Area: AlTaieu
-- NPC:  Aw_euvhi
-----------------------------------
package.loaded["scripts/zones/AlTaieu/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/AlTaieu/TextIDs");
require("scripts/globals/keyitems");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)    
end;
                           
-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   local mobID = mob:getID();
   if (mobID == 16912823 or mobID == 16912825 or mobID == 16912827) then
         if (killer:hasKeyItem(BLACK_CARD) == false) then 
          killer:addKeyItem(BLACK_CARD);
          killer:messageSpecial(KEYITEM_OBTAINED,BLACK_CARD);
         end
  elseif (mobID == 16912811 or mobID == 16912813 or mobID == 16912815) then
         if (killer:hasKeyItem(WHITE_CARD) == false) then 
          killer:addKeyItem(WHITE_CARD);
          killer:messageSpecial(KEYITEM_OBTAINED,WHITE_CARD);
         end
  elseif (mobID == 16912817 or mobID == 16912821 or mobID == 16912819) then
         if (killer:hasKeyItem(RED_CARD) == false) then 
          killer:addKeyItem(RED_CARD);
          killer:messageSpecial(KEYITEM_OBTAINED,RED_CARD);
         end
  end
end;