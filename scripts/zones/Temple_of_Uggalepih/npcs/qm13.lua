-----------------------------------
-- Area: Temple of Uggalepih
--  NPC: ??? (San dOria Mission 8-2)
-- @pos -68 -17 -153
-----------------------------------

local text = require("scripts/zones/Temple_of_Uggalepih/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/missions");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:getCurrentMission(SANDORIA) == LIGHTBRINGER and player:getVar("MissionStatus") == 4) then
        player:setVar("MissionStatus",5);
        player:addKeyItem(PIECE_OF_A_BROKEN_KEY3);
        player:messageSpecial(text.KEYITEM_OBTAINED,PIECE_OF_A_BROKEN_KEY3);
    else
        player:messageSpecial(text.NOTHING_OUT_OF_ORDINARY);
    end
end;