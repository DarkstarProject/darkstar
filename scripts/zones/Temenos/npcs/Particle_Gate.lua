-----------------------------------
-- Area: Temenos
-- NPC:  Particle_Gate
-----------------------------------

require("scripts/globals/limbus");
require("scripts/globals/keyitems");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local GateID =  npc:getID();
    local GateOffset = 16929221;
    -- print("GateID " ..GateID);
    -- player:PrintToPlayer(npc:getID());
    
    switch (GateID): caseof
    {
         -- 100-106 : Northern Tower
        [GateOffset] = function (x)
             player:startEvent(100);
        end,
        [GateOffset+1] = function (x)
             player:startEvent(101);
        end,
        [GateOffset+2] = function (x)
             player:startEvent(102);
        end,
        [GateOffset+3] = function (x)
             player:startEvent(103);
        end,
        [GateOffset+4] = function (x)
             player:startEvent(104);
        end,
        [GateOffset+5] = function (x)
             player:startEvent(105);
        end,
        [GateOffset+6] = function (x)
             player:startEvent(106);
        end,
        -- 107-113 : Eastern Tower
        [GateOffset+7] = function (x)
             player:startEvent(107);
        end,
        [GateOffset+8] = function (x)
             player:startEvent(108);
        end,
        [GateOffset+9] = function (x)
             player:startEvent(109);
        end,
        [GateOffset+10] = function (x)
             player:startEvent(110);
        end,
        [GateOffset+11] = function (x)
             player:startEvent(111);
        end,
        [GateOffset+12] = function (x)
             player:startEvent(112);
        end,
        [GateOffset+13] = function (x)
             player:startEvent(113);
        end,
        -- 114-120 Western Tower
        [GateOffset+14] = function (x)
             player:startEvent(114);
        end,
        [GateOffset+15] = function (x)
             player:startEvent(115);
        end,
        [GateOffset+16] = function (x)
             player:startEvent(116);
        end,
        [GateOffset+17] = function (x)
             player:startEvent(117);
        end,
        [GateOffset+18] = function (x)
             player:startEvent(118);
        end,
        [GateOffset+19] = function (x)
             player:startEvent(119);
        end,
        [GateOffset+20] = function (x)
             player:startEvent(120);
        end,
        -- The rest of Temenos
        [GateOffset+21] = function (x)
             player:startEvent(120);
        end,
        [GateOffset+22] = function (x)
             player:startEvent(120);
        end,
        [GateOffset+23] = function (x)
             player:startEvent(120);
        end,
        [GateOffset+24] = function (x)
             player:startEvent(120);
        end,
        [GateOffset+25] = function (x)
             player:startEvent(120);
        end,
    }
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
