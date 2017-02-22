-----------------------------------
--  Area:   Northern San d'Oria
--  NPC:    Porter Moogle
--  Type:   Storage Moogle
--  @zone 231
-- @pos TODO
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Northern_San_dOria/TextIDs");
require("scripts/globals/porter_moogle_util");

local e = 
{
    TALK_EVENT_ID       =   872,
    STORE_EVENT_ID      =   873,
    RETRIEVE_EVENT_ID   =   874,
    ALREADY_STORED_ID   =   875,
    MAGIAN_TRIAL_ID     =   876
};

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
    porterMoogleTrade(player, trade, e);
end

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
    -- No idea what the params are, other than event ID and gil.
    player:startEvent(e.TALK_EVENT_ID, 0x6FFFFF, 0x01, 0x06DD, 0x27, 0x7C7E, 0x15, player:getGil(), 0x03E8);
end

-----------------------------------
-- onEventUpdate
-----------------------------------
function onEventUpdate(player,csid,option)
    porterEventUpdate(player, csid, option, e.RETRIEVE_EVENT_ID, RETRIEVE_DIALOG_ID, ITEM_CANNOT_BE_OBTAINED);
end

-----------------------------------
-- onEventFinish
-----------------------------------
function onEventFinish(player,csid,option)
    porterEventFinish(player, csid, option, e.TALK_EVENT_ID, ITEM_CANNOT_BE_OBTAINED, ITEM_OBTAINED, NOT_HAVE_ENOUGH_GIL);
end