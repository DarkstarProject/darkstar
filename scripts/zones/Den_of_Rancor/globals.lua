-- Zone: Den of Rancor (160)
-- Desc: this file contains functions that are shared by multiple luas in this zone's directory
-----------------------------------
package.loaded["scripts/zones/Den_of_Rancor/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Den_of_Rancor/TextIDs")
require("scripts/zones/Den_of_Rancor/MobIDs")
require("scripts/globals/npc_util")
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

DEN_OF_RANCOR = {
    onTradeLantern = function(player, npc, trade)
        if npcUtil.tradeHas(trade, 1139) then -- crimson rancor
            if npc:getAnimation() == dsp.anim.OPEN_DOOR then
                player:messageSpecial(LANTERN_OFFSET + 7) -- already lit
            else
                player:confirmTrade()
                player:addItem(1138) -- return unlit lantern

                npc:openDoor(LANTERNS_STAY_LIT) -- light lantern

                local total = GetNPCByID(RANCOR_LANTERN_OFFSET + 0):getAnimation() +
                              GetNPCByID(RANCOR_LANTERN_OFFSET + 1):getAnimation() +
                              GetNPCByID(RANCOR_LANTERN_OFFSET + 2):getAnimation() +
                              GetNPCByID(RANCOR_LANTERN_OFFSET + 3):getAnimation()

                player:messageSpecial(LANTERN_OFFSET + 44 - total)
                
                if total == 32 then
                    for i = RANCOR_LANTERN_OFFSET, RANCOR_LANTERN_OFFSET + 3 do
                        GetNPCByID(i):closeDoor(1)
                        GetNPCByID(i):openDoor(30)
                    end
                    GetNPCByID(RANCOR_DROP_GATE):openDoor(30)
                end
            end
        end
    end,

    onTriggerLantern = function(player, npc)
        if npc:getAnimation() == dsp.anim.OPEN_DOOR then
            player:messageSpecial(LANTERN_OFFSET + 7) -- already lit
        else
            player:messageSpecial(LANTERN_OFFSET + 20) -- unlit
        end
    end,
}

return DEN_OF_RANCOR