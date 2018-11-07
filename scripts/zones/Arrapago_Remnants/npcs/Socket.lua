-----------------------------------
-- Area: Arrapago Remnants
-- NPC: Socket
-- Trade Cells to pop NM
-----------------------------------
local ID = require("scripts/zones/Arrapago_Remnants/IDs")
require("scripts/globals/npc_util")

function onTrade(player,npc,trade)
    local instance = npc:getInstance()
    local mob = instance:getEntity(bit.band(ID.mob[2][3].wahzil, 0xFFF), dsp.objType.MOB)
    local COUNT = trade:getItemCount()
    local CELLSTRADE = 
        {
            [5365] = {5365},
            [5366] = {5366},
            [5367] = {5367},
            [5368] = {5368},
            [5369] = {5369},
            [5370] = {5370},
            [5371] = {5371},
            [5372] = {5372},
            [5373] = {5373},
            [5374] = {5374},
            [5375] = {5375},
            [5376] = {5376},
            [5377] = {5377},
            [5378] = {5378},
            [5379] = {5379},
            [5380] = {5380},
            [5381] = {5381},
            [5382] = {5382},
            [5383] = {5383},
            [5384] = {5384},
        }
    if COUNT <= 5 and  trade:getSlotCount()== 1 then
        for k, v in pairs(CELLSTRADE) do
            if npcUtil.tradeHas(trade, v) then
                SpawnMob(ID.mob[2][3].wahzil, instance):updateClaim(player)
                player:tradeComplete()
                mob:setLocalVar("Cell", k)
                mob:setLocalVar("Qnt", COUNT)
                break
            end
        end
    end
end;

function onTrigger(entity, npc)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(entity, eventid, result)
end