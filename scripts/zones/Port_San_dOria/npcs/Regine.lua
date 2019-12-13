-----------------------------------
-- Area: Port San d'Oria
--  NPC: Regine
-- Standard Merchant NPC
-- !pos 68 -9 -74 232
-----------------------------------
local ID = require("scripts/zones/Port_San_dOria/IDs");
require("scripts/globals/npc_util");
require("scripts/globals/quests");
require("scripts/globals/shop");

function onTrade(player,npc,trade)
    local flyersForRegine = player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.FLYERS_FOR_REGINE);
    local theBrugaireConsortium = player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.THE_BRUGAIRE_CONSORTIUM);

    -- FLYERS FOR REGINE
    if (flyersForRegine == QUEST_ACCEPTED and npcUtil.tradeHas( trade, {{"gil",10}} )) then
        if (npcUtil.giveItem(player, 532)) then
            player:confirmTrade();
        end
    elseif (flyersForRegine == QUEST_ACCEPTED and npcUtil.tradeHas(trade, 532)) then
        player:messageSpecial(ID.text.FLYER_REFUSED);

    -- THE BRUGAIRE CONSORTIUM
    elseif (theBrugaireConsortium == QUEST_ACCEPTED and npcUtil.tradeHas(trade, 593)) then
        player:startEvent(535);
    end
end;

function onTrigger(player,npc)
    local ffr = player:getCharVar("FFR");

    -- FLYERS FOR REGINE
    if (player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.FLYERS_FOR_REGINE) == QUEST_AVAILABLE and ffr == 0) then
        player:startEvent(601);
    elseif (ffr == 1) then
        player:startEvent(510,2);
    elseif (player:getCharVar("FFR") == 2) then
        player:startEvent(603);
    elseif (player:getCharVar("FFR") > 2 and not player:hasItem(532)) then
        player:startEvent(510,3);
        
    -- DEFAULT MENU
    else
        player:startEvent(510);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    -- FLYERS FOR REGINE
    if (csid == 601) then
        player:setCharVar("FFR",1);
    elseif (csid == 510 and option == 2) then
        if (npcUtil.giveItem(player, {{532,12}, {532,3}} )) then
            player:addQuest(SANDORIA,dsp.quest.id.sandoria.FLYERS_FOR_REGINE);
            player:setCharVar("FFR",17);
        end
    elseif (csid == 603) then
        if (npcUtil.completeQuest(player, SANDORIA, dsp.quest.id.sandoria.FLYERS_FOR_REGINE, {gil=440, title=dsp.title.ADVERTISING_EXECUTIVE})) then
            player:setCharVar("tradeAnswald",0);
            player:setCharVar("tradePrietta",0);
            player:setCharVar("tradeMiene",0);
            player:setCharVar("tradePortaure",0);
            player:setCharVar("tradeAuvare",0);
            player:setCharVar("tradeGuilberdrier",0);
            player:setCharVar("tradeVilion",0);
            player:setCharVar("tradeCapiria",0);
            player:setCharVar("tradeBoncort",0);
            player:setCharVar("tradeCoullene",0);
            player:setCharVar("tradeLeuveret",0);
            player:setCharVar("tradeBlendare",0);
            player:setCharVar("tradeMaugie",0);
            player:setCharVar("tradeAdaunel",0);
            player:setCharVar("tradeRosel",0);
            player:setCharVar("FFR",0);
        end

    -- THE BRUGAIRE CONSORTIUM
    elseif (csid == 535) then
        player:confirmTrade();
        player:setCharVar("TheBrugaireConsortium-Parcels", 11);
        
    -- WHITE MAGIC SHOP
    elseif (csid == 510 and option == 0) then
        local stockA =
        {
            4641,1165,1, -- Scroll of Diaga
            4664,837,1,  -- Scroll of Slow
            4662,7025,1, -- Scroll of Stoneskin

            4636,140,2,  -- Scroll of Banish
            4646,1165,2, -- Scroll of Banishga
            4661,2097,2, -- Scroll of Blink
            4610,585,2,  -- Scroll of Cure II

            4663,360,3,  -- Scroll of Aquaveil
            4624,990,3,  -- Scroll of Blindna
            4615,1363,3, -- Scroll of Curaga
            4609,61,3,   -- Scroll of Cure
            4631,82,3,   -- Scroll of Dia
            4623,324,3,  -- Scroll of Paralyna
            4622,180,3,  -- Scroll of Poisona
            4651,219,3,  -- Scroll of Protect
            4656,1584,3  -- Scroll of Shell
        }
        dsp.shop.nation(player, stockA, dsp.nation.SANDORIA);

    -- BLACK MAGIC SHOP
    elseif (csid == 510 and option == 1) then
        local stockB =
        {
            4862,111,1,  -- Scroll of Blind
            4838,360,2,  -- Scroll of Bio
            4828,82,2,   -- Scroll of Poison
            4861,2250,2, -- Scroll of Sleep

            4762,324,3,  -- Scroll of Aero
            4757,1584,3, -- Scroll of Blizzard
            4843,4644,3, -- Scroll of Burn
            4845,2250,3, -- Scroll of Choke
            4848,6366,3, -- Scroll of Drown
            4752,837,3,  -- Scroll of Fire
            4844,3688,3, -- Scroll of Frost
            4846,1827,3, -- Scroll of Rasp
            4847,1363,3, -- Scroll of Shock
            4767,61,3,   -- Scroll of Stone
            4772,3261,3, -- Scroll of Thunder
            4777,140,3   -- Scroll of Water
        }
        dsp.shop.nation(player, stockB, dsp.nation.SANDORIA);
    end
end;
