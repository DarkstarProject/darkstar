-----------------------------------
--
-- Zone: Ilrusi_Atoll
--  zone 55
-----------------------------------
require("scripts/globals/settings");
package.loaded["scripts/zones/Ilrusi_Atoll/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Ilrusi_Atoll/TextIDs");
require("scripts/globals/settings");
-----------------------------------

function onInitialize(zone)
end;

function onZoneIn(player,prevZone)
    local cs = -1;

   --------------RANDOMIZE COFFER------------------------
  local correctcoffer = math.random(17002505,17002516);
  SetServerVariable("correctcoffer",correctcoffer);
  printf("corect_golden_salvage_coffer: %u",correctcoffer);
  ---------------------------------------------------


    return cs;
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

