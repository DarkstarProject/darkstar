-----------------------------------
-- Area: Sauromugue Champaign
-- MOB: Dribblix Greasemaw
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
local text = require("scripts/zones/Sauromugue_Champaign/TextIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    if (ally:hasKeyItem(SEEDSPALL_VIRIDIS) == false and ally:hasKeyItem(VIRIDIAN_KEY) == false) then
        ally:addKeyItem(SEEDSPALL_VIRIDIS);
        ally:messageSpecial(text.KEYITEM_OBTAINED,SEEDSPALL_VIRIDIS);
    end
end;