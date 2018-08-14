-----------------------------------
-- Area: Ilrusi Atoll
--  NPC: Treasure Coffer
-----------------------------------
package.loaded["scripts/zones/Ilrusi_Atoll/IDs"] = nil
-------------------------------------
require("scripts/zones/Ilrusi_Atoll/IDs")
require("scripts/globals/status")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    player:messageSpecial(Ilrusi.text.CHEST)
    
    local npcID = npc:getID()
    local instance = npc:getInstance()
    local figureheadChest = instance:getProgress()

    if (npcID == figureheadChest) then
        player:messageSpecial(Ilrusi.text.GOLDEN)
        instance:complete()
        for i,v in pairs(Ilrusi.mobs[2]) do
            DespawnMob(v, instance)
        end
    else
        SpawnMob(npcID, instance):updateClaim(player)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end