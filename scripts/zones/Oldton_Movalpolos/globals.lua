-- Zone: Oldton Movalopolos (11)
-- Desc: this file contains functions that are shared by multiple luas in this zone's directory
-----------------------------------
local ID = require("scripts/zones/Oldton_Movalpolos/IDs");
-----------------------------------

OLDTON_MOVALPOLOS = {
    --[[..............................................................................................
        move the ScrawledWriting NPC.
        ..............................................................................................]]
    moveScrawledWriting = function(secondsHidden)
        
        
        local mob = GetMobByID(ID.mob.GOBLIN_WOLFMAN);
        GetNPCByID(ID.npc.SCRAWLED_WRITING):setStatus(2) --STATUS_DISAPPEAR
        
        mob:addListener("DESPAWN", "GOBLIN_WOLFMAN_DESPAWN", function(mob, target)
            local npc = GetNPCByID(ID.npc.SCRAWLED_WRITING);
            switch (math.random(1,2)): caseof
            {
                [1] = function (x) npc:setPos(-16.806, 7.718, 14.155); end,
                [2] = function (x) npc:setPos(-18.0, 12.0, -115.0); end, --approximate retail position 
                [3] = function (x) npc:setPos(-150.0, 8.0, -252.0); end, --approximate retial position
            }
            npc:timer(secondsHidden * 1000, function(npc) npc:setStatus(0); end); --STATUS_NORMAL
        end)
    end
}

return OLDTON_MOVALPOLOS;