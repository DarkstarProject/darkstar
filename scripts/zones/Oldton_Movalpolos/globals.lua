-- Zone: Oldton Movalopolos (11)
-- Desc: this file contains functions that are shared by multiple luas in this zone's directory
-----------------------------------
local ID = require("scripts/zones/Oldton_Movalpolos/IDs");
require("scripts/globals/npc_util");
-----------------------------------

OLDTON_MOVALPOLOS = {
    --[[..............................................................................................
        move the ScrawledWriting NPC.
        ..............................................................................................]]
    moveScrawledWriting = function(secondsHidden)
        local mob = GetMobByID(ID.mob.GOBLIN_WOLFMAN);
        local npc = GetNPCByID(ID.npc.SCRAWLED_WRITING);
        npc:showNPC(1) --trigger STATUS_DISAPPEAR
        mob:addListener("DESPAWN", "GOBLIN_WOLFMAN_DESPAWN", function(mob, target)
            npc:updateNPCHideTime(secondsHidden) --hide for secondsHidden
            switch (math.random(1,3)): caseof
            {
                [1] = function (x) npc:setPos(-16.806, 7.718, 14.155); end,
                [2] = function (x) npc:setPos(-18.0, 12.0, -115.0); end, --approximate retail position 
                [3] = function (x) npc:setPos(-150.0, 8.0, -252.0); end, --approximate retial position
            }
        end)
    end
}

return OLDTON_MOVALPOLOS;