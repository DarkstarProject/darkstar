-----------------------------------
--
--     Functions for Conquest system
--
-----------------------------------

require("scripts/globals/common");
require("scripts/globals/missions");

-----------------------------------
-- convenience constants
-----------------------------------

NATION_SANDORIA = 0;
NATION_BASTOK   = 1;
NATION_WINDURST = 2;
BEASTMEN        = 3;
OTHER           = 4;

RONFAURE        = 0;
ZULKHEIM        = 1;
NORVALLEN       = 2;
GUSTABERG       = 3;
DERFLAND        = 4;
SARUTABARUTA    = 5;
KOLSHUSHU       = 6;
ARAGONEU        = 7;
FAUREGANDI      = 8;
VALDEAUNIA      = 9;
QUFIMISLAND     = 10;
LITELOR         = 11;
KUZOTZ          = 12;
VOLLBOW         = 13;
ELSHIMOLOWLANDS = 14;
ELSHIMOUPLANDS  = 15;
TULIA           = 16;
MOVALPOLOS      = 17;
TAVNAZIANARCH   = 18;

CONQUEST_TALLY_START = 0;
CONQUEST_TALLY_END   = 1;
CONQUEST_UPDATE      = 2;

nationAlly = 3;

-----------------------------------
-- San d'Oria inventory
-- {Option,CP,Item}
-----------------------------------

SandInv = {0x80A1,0x000A,0x1055,0x80A0,0x0007,0x1056,0x80A3,0x2328,0x3CB5,
           0x80A2,0x09C4,0x3CB6,0x80A5,0x01F4,0x3D91,0x80A6,0x03E8,0x3D92,
           0x80A7,0x07D0,0x3D93,0x8002,0x03E8,0x30DE,0x8003,0x03E8,0x31D1,
           0x8004,0x03E8,0x32CC,0x8006,0x03E8,0x3596,0x8001,0x03E8,0x40A0,
           0x8005,0x03E8,0x4133,0x8000,0x03E8,0x430F,0x8011,0x07D0,0x3156,
           0x8012,0x07D0,0x3252,0x8014,0x07D0,0x32F5,0x8010,0x07D0,0x41D4,
           0x8013,0x07D0,0x43D7,0x8022,0x0FA0,0x308F,0x8023,0x0FA0,0x318F,
           0x8024,0x0FA0,0x328F,0x8021,0x0FA0,0x3330,0x8027,0x0FA0,0x34B7,
           0x8025,0x0FA0,0x4168,0x8020,0x0FA0,0x41CC,0x8026,0x0FA0,0x42FE,
           0x8034,0x1F40,0x3030,0x8031,0x1F40,0x310F,0x8032,0x1F40,0x320F,
           0x8033,0x1F40,0x3597,0x8030,0x1F40,0x40D9,0x8042,0x3E80,0x3018,
           0x8043,0x3E80,0x3019,0x8046,0x3E80,0x318E,0x8047,0x3E80,0x328E,
           0x8045,0x3E80,0x3331,0x8044,0x3E80,0x3333,0x8048,0x3E80,0x33A4,
           0x8049,0x3E80,0x3598,0x8041,0x3E80,0x40BB,0x8040,0x3E80,0x41D3,
           0x8056,0x5DC0,0x3021,0x8052,0x5DC0,0x308E,0x8054,0x5DC0,0x310E,
           0x8055,0x5DC0,0x320E,0x8051,0x5DC0,0x3332,0x8050,0x5DC0,0x350C,
           0x8053,0x5DC0,0x359A,0x8058,0x5DC0,0x40D7,0x8059,0x5DC0,0x41A5,
           0x8057,0x5DC0,0x42AB,0x8062,0x7D00,0x34F5,0x8061,0x7D00,0x41F6,
           0x8060,0x7D00,0x4932,0x8072,0x9C40,0x3354,0x8070,0x9C40,0x36BD,
           0x8071,0x9C40,0x36BE,0x8083,0xBB80,0x41FD,0x8080,0xBB80,0x4239,
           0x8082,0xBB80,0x4432,0x8081,0xBB80,0x460E,0x8090,0xDAC0,0x385C,
           0x80A4,0x1388,0x44AF,0x80A8,0x1388,0x6F7C};

-----------------------------------
-- Bastok inventory
-- {Option,CP,Item}
-----------------------------------

BastInv = {0x80A1,0x000A,0x1055,0x80A0,0x0007,0x1056,0x80A3,0x2328,0x3CB5,
           0x80A2,0x09C4,0x3CB6,0x80A5,0x01F4,0x3D91,0x80A6,0x03E8,0x3D92,
           0x80A7,0x07D0,0x3D93,0x8003,0x03E8,0x30DD,0x8004,0x03E8,0x31D0,
           0x8005,0x03E8,0x32CB,0x8000,0x03E8,0x4031,0x8002,0x03E8,0x4108,
           0x8007,0x03E8,0x418C,0x8006,0x03E8,0x42E8,0x8001,0x03E8,0x4347,
           0x8014,0x07D0,0x3031,0x8011,0x07D0,0x3155,0x8012,0x07D0,0x3251,
           0x8013,0x07D0,0x4169,0x8010,0x07D0,0x4298,0x8022,0x0FA0,0x3096,
           0x8023,0x0FA0,0x3116,0x8024,0x0FA0,0x3196,0x8025,0x0FA0,0x3216,
           0x8026,0x0FA0,0x3296,0x8021,0x0FA0,0x332A,0x8029,0x0FA0,0x34B9,
           0x8028,0x0FA0,0x3606,0x8020,0x0FA0,0x4148,0x8027,0x0FA0,0x41A6,
           0x8031,0x1F40,0x3086,0x8032,0x1F40,0x3186,0x8033,0x1F40,0x3286,
           0x8034,0x1F40,0x3599,0x8030,0x1F40,0x4084,0x8035,0x1F40,0x4383,
           0x8042,0x3E80,0x3106,0x8043,0x3E80,0x3206,0x8041,0x3E80,0x332B,
           0x8040,0x3E80,0x4091,0x8044,0x3E80,0x42E9,0x8045,0x3E80,0x4365,
           0x8053,0x5DC0,0x3010,0x8055,0x5DC0,0x3308,0x8050,0x5DC0,0x332C,
           0x8051,0x5DC0,0x350E,0x8052,0x5DC0,0x40AD,0x8054,0x5DC0,0x42FF,
           0x8062,0x7D00,0x34F6,0x8060,0x7D00,0x3E55,0x8061,0x7D00,0x458F,
           0x8072,0x9C40,0x3355,0x8071,0x9C40,0x3638,0x8070,0x9C40,0x36BF,
           0x8080,0xBB80,0x419F,0x8081,0xBB80,0x4431,0x8083,0xBB80,0x44F7,
           0x8082,0xBB80,0x4714,0x8090,0xDAC0,0x385D,0x80A4,0x1388,0x44B0,
           0x80A8,0x1388,0x6F7C};

-----------------------------------
-- Windurst inventory
-- {Option,CP,Item}
-----------------------------------

WindInv = {0x80A1,0x000A,0x1055,0x8044,0x3E80,0x31BE,0x8025,0x0FA0,0x32B6,
           0x80A0,0x0007,0x1056,0x8045,0x3E80,0x323E,0x8027,0x0FA0,0x33A5,
           0x80A3,0x2328,0x3CB5,0x8046,0x3E80,0x32BE,0x8028,0x0FA0,0x34B8,
           0x80A2,0x09C4,0x3CB6,0x8041,0x3E80,0x332E,0x8026,0x0FA0,0x416B,
           0x80A5,0x01F4,0x3D91,0x8047,0x3E80,0x41AA,0x8020,0x0FA0,0x4188,
           0x80A6,0x03E8,0x3D92,0x8048,0x3E80,0x4136,0x8033,0x1F40,0x3146,
           0x80A7,0x07D0,0x3D93,0x8040,0x3E80,0x42BA,0x8034,0x1F40,0x31C7,
           0x8003,0x03E8,0x3273,0x8050,0x5DC0,0x332F,0x8035,0x1F40,0x3246,
           0x8002,0x03E8,0x403A,0x8051,0x5DC0,0x350D,0x8036,0x1F40,0x32C6,
           0x8001,0x03E8,0x4284,0x8053,0x5DC0,0x41A8,0x8032,0x1F40,0x332D,
           0x8004,0x03E8,0x42EA,0x8054,0x5DC0,0x41A9,0x8030,0x1F40,0x404F,
           0x8000,0x03E8,0x4307,0x8052,0x5DC0,0x42C6,0x8038,0x1F40,0x411D,
           0x8011,0x07D0,0x30C4,0x8061,0x7D00,0x304B,0x8037,0x1F40,0x41A7,
           0x8012,0x07D0,0x316D,0x8062,0x7D00,0x34F7,0x8031,0x1F40,0x4382,
           0x8013,0x07D0,0x31AF,0x8060,0x7D00,0x3E56,0x8042,0x3E80,0x30BE,
           0x8014,0x07D0,0x3237,0x8072,0x9C40,0x3356,0x8043,0x3E80,0x313E,
           0x8015,0x07D0,0x32AF,0x8070,0x9C40,0x36C0,0x80A4,0x1388,0x44B1,
           0x8016,0x07D0,0x416A,0x8071,0x9C40,0x36C1,0x8024,0x0FA0,0x3236,
           0x8017,0x07D0,0x4222,0x8082,0xBB80,0x4464,0x8090,0xDAC0,0x385E,
           0x8010,0x07D0,0x42CF,0x8081,0xBB80,0x447A,0x8023,0x0FA0,0x31B6,
           0x8021,0x0FA0,0x30B6,0x8083,0xBB80,0x44D1,0x8080,0xBB80,0x46E1,
           0x8022,0x0FA0,0x3136,0x80A8,0x1388,0x6F7C};

-----------------------------------
-- Crystal Donate Array
-- Conquest Point Required for recharged the ring + charge
-- CP Reward for Supply Quest
-- TP Fees
-----------------------------------

DonateCrys = {4096,4097,4098,4099,4100,4101,4102,4103,4238,4239,4240,4241,4242,4243,4244,4245};
XpRing = {350,700,600}; RingCharg = {7,7,3};
supplyReward = {10,30,40,10,40,10,40,40,70,50,60,40,70,70,70,70,70,70,70};
tpFees = { 100, 100, 150, 100, 150, 100, 100, 150, 350, 400, 150, 250, 300, 500, 250, 350, 500, 0, 300 }

----------------------------------------------------------------
-- function tradeConquestGuard()
-----------------------------------------------------------------

function tradeConquestGuard(player,npc,trade,guardnation,guardtype)

    -- Nation:    -- NATION_SANDORIA, NATION_BASTOK, NATION_WINDURST, OTHER(Jeuno)
    -- Type:     1: city, 2: foreign, 3: outpost, 4: border

    local myCP = player:getCP();
    local item = trade:getItemId();
    local AddPoints = 0;

    if (player:getNation() == guardnation or guardnation == OTHER) then
        if (guardtype ~= 3 and guardtype ~= 4) then -- all guard can trade crystal except outpost and border.
            if (item >= 4096 and item <= 4103 or item >= 4238 and item <= 4245) then
                for Crystal = 1,#DonateCrys,1 do
                    local tcount = trade:getItemQty(DonateCrys[Crystal])

                    if (tcount > 0 and trade:hasItemQty(DonateCrys[Crystal],tcount)) then
                        if (player:getRank() == 1) then
                            player:showText(npc,CONQUEST - 7);
                            break;
                        elseif (player:getRankPoints() == 4000) then
                            player:showText(npc,CONQUEST + 43);
                            break;
                        elseif (DonateCrys[Crystal] == 4102 or DonateCrys[Crystal] == 4103 or DonateCrys[Crystal] == 4244 or DonateCrys[Crystal] == 4245) then
                            AddPoints = AddPoints + tcount * math.floor(4000 / (player:getRank() * 12 - 16));
                        else
                            AddPoints = AddPoints + tcount * math.floor(4000 / (player:getRank() * 12 - 12));
                        end
                    end
                end

                if (player:getRank() ~= 1 and player:getRankPoints() < 4000) then
                    if (AddPoints + player:getRankPoints() >= 4000) then
                        newpoint = (AddPoints + player:getRankPoints()) - 4000;
                        player:addCP(newpoint);
                        player:setRankPoints(4000);
                        player:showText(npc,CONQUEST + 44);
                    else
                        --printf("point: %u",AddPoints);
                        player:addRankPoints(AddPoints);
                        player:showText(npc,CONQUEST + 45);
                    end
                    player:tradeComplete();
                end
            end
        end

        if (item >= 15761 and item <= 15763) then -- All guard can recharge ring - I can't read number of charge atm
            if (trade:hasItemQty(item,1) and trade:getItemCount() == 1 and player:getVar("CONQUEST_RING_RECHARGE") < os.time() and
            (ALLOW_MULTIPLE_EXP_RINGS == 1 or checkConquestRing(player) < 2)) then
                if (myCP >= XpRing[item - 15760]) then

                    player:delCP(XpRing[item - 15760]);
                    player:tradeComplete();
                    player:addItem(item);
                    player:setVar("CONQUEST_RING_RECHARGE",getConquestTally());
                    player:showText(npc,CONQUEST + 58,item,XpRing[item - 15760],RingCharg[(item - 15760)]);
                else
                    player:showText(npc,CONQUEST + 55,item,XpRing[item - 15760]);
                end
         else
            -- TODO: Verify that message is retail correct.
            -- This gives feedback on a failure at least, and is grouped with the recharge messages.  Confident enough for a commit.
            player:showText(npc,CONQUEST+56,item); -- "Please be aware that you can only purchase or recharge <item> once during the period between each conquest results tally.
            end
        end
    end

end;

function updateConquestGuard(player,csid,option,size,inventory)
    if (option >= 32768 and option <= 32944) then
        for Item = 1,size,3 do
            if (option == inventory[Item]) then
                local CPVerify = 1;
                if (player:getCP() >= inventory[Item + 1]) then
                    CPVerify = 0;
                end;

                player:updateEvent(2,CPVerify,inventory[Item + 2]);
                break;
            end
        end
    end
end;

function finishConquestGuard(player,csid,option,size,inventory,guardnation)
    if (option == 1) then
        local duration = (player:getRank() + getNationRank(player:getNation()) + 3) * 3600;
        player:delStatusEffectSilent(dsp.effects.SIGIL);
        player:delStatusEffectSilent(dsp.effects.SANCTION);
        player:delStatusEffectSilent(dsp.effects.SIGNET);
        player:addStatusEffect(dsp.effects.SIGNET,0,0,duration); -- Grant Signet
    elseif (option >= 32768 and option <= 32944) then
        for Item = 1,size,3 do
            if (option == inventory[Item]) then
                if (player:getFreeSlotsCount() >= 1) then
                    -- Logic to impose limits on exp bands
                    if (option >= 32933 and option <= 32935) then
                        if (checkConquestRing(player) > 0) then
                            player:messageSpecial(CONQUEST+60,0,0,inventory[Item+2]);
                            break;
                        else
                            player:setVar("CONQUEST_RING_TIMER",getConquestTally());
                        end
                    end

                    local itemCP;
                    if (player:getNation() == guardnation or guardnation == OTHER) then
                        itemCP = inventory[Item + 1];
                    else
                        if (inventory[Item + 1] <= 8000) then
                            itemCP = inventory[Item + 1] * 2;
                        else
                            itemCP = inventory[Item + 1] + 8000;
                        end;
                    end;

                    if (player:hasItem(inventory[Item + 2]) == false and player:getCP() >= itemCP) then
                        player:delCP(itemCP);
                        player:addItem(inventory[Item + 2],1);
                        player:messageSpecial(ITEM_OBTAINED,inventory[Item + 2]);
                    else
                        player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,inventory[Item + 2]);
                    end;
                else
                    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,inventory[Item + 2]);
                end;
                break;
            end;
        end;
    elseif (option >= 65541 and option <= 65565) then -- player chose supply quest.
        local region = option - 65541;
        player:addKeyItem(getSupplyKey(region));
        player:messageSpecial(KEYITEM_OBTAINED,getSupplyKey(region));
        player:setVar("supplyQuest_started",vanaDay());
        player:setVar("supplyQuest_region",region);
        player:setVar("supplyQuest_fresh",getConquestTally());
    end;
end;

-------------------------------------------------------------------------
-- function suppliesFresh(player) [NEED COMMAND] 0: delete old supply after weekly conquest tally
-------------------------------------------------------------------------

function supplyRunFresh(player)

    local fresh = player:getVar("supplyQuest_fresh");
    local started = player:getVar("supplyQuest_started");
    local region = player:getVar("supplyQuest_region");

    if ((fresh <= os.time() and (region > 0 or player:hasKeyItem(75))) or
      started <= 400) then -- Legacy support to remove supplies from the old system, otherwise they'd never go away.
        return 0;
    else
        return 1;
    end;

end;

----------------------------------------------------------------
-- function getArg1(player)
-----------------------------------------------------------------

windurst_bastok_ally = 0;
sandy_windurst_ally = 0;
sandy_bastok_ally = 0;

function getArg1(guardnation,player)

    local pNation = player:getNation();
    local output = 0;
    local signet = 0;

    if (guardnation == NATION_WINDURST) then
        output = 33;
    elseif (guardnation == NATION_SANDORIA) then
        output = 1;
    elseif (guardnation == NATION_BASTOK) then
        output = 17;
    end

    if (guardnation == pNation) then
        signet = 0;
    elseif (pNation == NATION_WINDURST) then
        if (guardnation == NATION_BASTOK and windurst_bastok_ally == 1) or (guardnation == NATION_SANDORIA and sandy_windurst_ally == 1) then
            signet = 1;
        else
            signet = 7;
        end
    elseif (pNation == NATION_BASTOK) then
        if (guardnation == NATION_WINDURST and windurst_bastok_ally == 1) or (guardnation == NATION_SANDORIA and sandy_bastok_ally == 1) then
            signet = 2;
        else
            signet = 7;
        end
    elseif (pNation == NATION_SANDORIA) then
        if (guardnation == NATION_WINDURST and sandy_windurst_ally == 1) or (guardnation == NATION_BASTOK and sandy_bastok_ally == 1) then
            signet = 4;
        else
            signet = 7;
        end
    end

    if (guardnation == OTHER) then
        output = (pNation * 16) + (3 * 256)  + 65537;
    else
        output = output + 256 * signet;
    end

    return output;

end;

------------------------------------------------
-- function getExForceAvailable(guardnation,player) Expeditionary Force Menu [NOT IMPLEMENTED]
------------------------------------------------

function getExForceAvailable(guardnation,player)
    return 0;
end;

------------------------------------------------
-- function conquest_ranking() computes part of argument 3 for gate guard events.
-- it represents the conquest standing of the 3 nations. Verified.
------------------------------------------------

function conquestRanking()
    return getNationRank(NATION_SANDORIA) + 4 * getNationRank(NATION_BASTOK) + 16 * getNationRank(NATION_WINDURST);
end;

----------------------------------------------------------------
-- function getSupplyAvailable(nation,player) produces the supply quest mask for the nation based on the current conquest standings.
----------------------------------------------------------------

function getSupplyAvailable(nation,player)

    local mask = 2130706463;

    if (player:getVar("supplyQuest_started") == vanaDay()) then
        mask = 4294967295; -- Need to wait 1 vanadiel day
    end

    for nb = 0,15 do
        if (player:hasKeyItem(getSupplyKey(nb))) then
            mask = -1; -- if you have supply run already activated
        end
    end
    if (player:hasKeyItem(getSupplyKey(18))) then -- we need to skip 16 and 17 for now
        mask = -1;
    end

    if (mask ~= -1 and mask ~= 4294967295) then
        for i = 0,18 do
            if (GetRegionOwner(i) ~= nation or
               i == 16 or
               (i == 18 and player:hasCompletedMission(COP,DARKNESS_NAMED) == false)) then
                mask = mask + 2^(i + 5);
            end
        end
    end

    return mask;

end;

----------------------------------------------------------------
-- function getArg6(player) computes argument 6 for gate guard events. This number encodes a player's rank and nationality:
-- bits 1-4 encode the rank of the player (verified that bit 4 is part of the rank number so ranks could have gone up to 31.)
-- bits 5-6 seem to encode the citizenship as below. This part needs more testing and verification.
-----------------------------------------------------------------

function getArg6(player)

    local output = player:getRank();
    local nation = player:getNation();

    if (nation == NATION_SANDORIA) then
        return output;
    elseif (nation == NATION_BASTOK) then
        return output + 32;
    elseif (nation == NATION_WINDURST) then
        return output + 64;

    end

end;

------------------------------------------------
-- function getRewardExForce(guardnation,player) Expeditionary Force Reward [NOT IMPLEMENTED]
------------------------------------------------

function getRewardExForce(guardnation,player)
    return 0;
end;

------------------------------------------------
-- function getKeySupply(region)
------------------------------------------------

function getSupplyKey(region)

    if (region <= 9) then
        return 75 + region;
    elseif (region == 10) then
        return 124;
    elseif (region <= 13) then
        return 74 + region;
    elseif (region <= 15) then
        return 248 + region;
    elseif (region == 18) then
        return 620;
    end

end;

-----------------------------------------------------------------
-- giltosetHP(player) returns the amount of gil it costs a player to set a homepoint at a foreign outpost/border guard.
-----------------------------------------------------------------

function giltosetHP(guardnation,player)

    local rank = player:getRank();

    if (getArg1(guardnation,player) < 0x700) then -- determine ifplayer is in same or allied nation as guard
        HPgil = 0;
    else
        if (rank <= 5) then
            HPgil = 100 * 2^(rank - 1);
        else
            HPgil = 800 * rank - 2400;
        end
    end

    return HPgil;

end;

-----------------------------------------------------------------
-- function hasOutpost(player, region) returns 1 ifthe player has the outpost of the indicated region under current allegiance.
-----------------------------------------------------------------

function hasOutpost(player, region)

    local nation = player:getNation()
    local bit = {};

    if (nation == NATION_BASTOK) then
        supply_quests = player:getNationTeleport(NATION_BASTOK);
    elseif (nation == NATION_SANDORIA) then
        supply_quests = player:getNationTeleport(NATION_SANDORIA);
    elseif (nation == NATION_WINDURST) then
        supply_quests = player:getNationTeleport(NATION_WINDURST);
    end;

    for i = 23,5,-1 do
        twop = 2^i
        if (supply_quests >= twop) then
            bit[i]=1;
            supply_quests = supply_quests - twop;
        else
            bit[i]=0;
        end;
        --printf("bit %u: %u \n",i,bit[i]);
    end;

    return bit[region];

end;

-----------------------------------------------------------------
-- function OP_TeleFee(player,region)
-----------------------------------------------------------------

function OP_TeleFee(player,region)

    if (hasOutpost(player, region+5) == 1) then
        if (GetRegionOwner(region) == player:getNation()) then
            return tpFees[region + 1];
        else
            return tpFees[region + 1] * 3;
        end
    else
        return 0;
    end

end;

-----------------------------------------------------------------
-- Teleport Outpost > Nation
-----------------------------------------------------------------

function toHomeNation(player)

    if (player:getNation() == NATION_BASTOK) then
        player:setPos(89, 0 , -66, 0, 234);
    elseif (player:getNation() == NATION_SANDORIA) then
        player:setPos(49, -1 , 29, 164, 231);
    else
        player:setPos(193, -12 , 220, 64, 240);
    end

end;

-----------------------------------------------------------------
-- function getTeleAvailable(nation)
-----------------------------------------------------------------

function getTeleAvailable(nation)

    local mask = 2145386527;

    for i = 5,23 do
        if (GetRegionOwner(i - 5) ~= nation) then
            mask = mask + 2^i;
        end;
    end

    return mask;

end;

---------------------------------
-- Teleport Nation > Outpost
---------------------------------

function toOutpost(player,option)
-- Coordinates marked {R} have been obtained by packet capture from retail. Don't change them.

    -- Ronfaure
    if (option == 5) then
        player:setPos(-437.688, -20.255, -219.227, 124, 100); -- {R}
    -- Zulkheim
    elseif (option == 6) then
        player:setPos(148.231, -7.975 , 93.479, 154, 103);       -- {R}
    -- Norvallen
    elseif (option == 7) then
        player:setPos(62.030, 0.463, -2.025, 67, 104);           -- {R}
    -- Gustaberg
    elseif (option == 8) then
        player:setPos(-580.161, 39.578, 62.68, 89, 106);      -- {R}
    -- Derfland
    elseif (option == 9) then
        player:setPos(465.820, 23.625, 423.164, 29, 109);       -- {R}
    -- Sarutabaruta
    elseif (option == 10) then
        player:setPos(-17.921, -13.335, 318.156, 254, 115);      -- {R}
    -- Kolshushu
    elseif (option == 11) then
        player:setPos(-480.237, -30.943, 58.079, 62, 118);      -- {R}
    -- Aragoneu
    elseif (option == 12) then
        player:setPos(-297.047, 16.988, 418.026, 225, 119);      -- {R}
    -- Fauregandi
    elseif (option == 13) then
        player:setPos(-18.690, -60.048, -109.243, 100, 111);  -- {R}
    -- Valdeaunia
    elseif (option == 14) then
        player:setPos(211.210, -24.016, -207.338, 160, 112);  -- {R}
    -- Qufim Island
    elseif (option == 15) then
        player:setPos(-243.049, -19.983, 306.712, 71, 126);   -- {R}
    -- Li'Telor
    elseif (option == 16) then
        player:setPos(-37.669, 0.419, -141.216, 69, 121);      -- {R}
    -- Kuzotz
    elseif (option == 17) then
        player:setPos(-249.983, 7.965, -252.976, 122, 114);   -- {R}
    -- Vollbow
    elseif (option == 18) then
        player:setPos(-176.360, 7.624, -63.580, 122, 113);      -- {R}
    -- Elshimo Lowlands
    elseif (option == 19) then
        player:setPos(-240.860, -0.031, -388.434, 64, 123);   -- {R}
    -- Elshimo Uplands
    elseif (option == 20) then
        player:setPos(207.821, -0.128, -86.623, 159, 124);      -- {R}
    -- Tu'Lia ?!
    elseif (option == 21) then
        player:setPos(4, -54, -600, 192, 130);                -- Dummied out?
    -- Tavnazia
    elseif (option == 23) then
        player:setPos(-535.861, -7.149, -53.628, 122, 24);    -- {R}
    end;
end;

-----------------------------------
-- Expeditionary Force
-- {Option,Quest,Zone,MenuMask,MinimumLevel,KeyItem} NOT USED
-----------------------------------
EXFORCE = {0x20006,ZULK_EF,0x67,0x000040,0x14,ZULKHEIM_EF_INSIGNIA,
           0x20007,NORV_EF,0x68,0x000080,0x19,NORVALLEN_EF_INSIGNIA,
           0x20009,DERF_EF,0x6D,0x000200,0x19,DERFLAND_EF_INSIGNIA,
           0x2000B,KOLS_EF,0x76,0x000800,0x14,KOLSHUSHU_EF_INSIGNIA,
           0x2000C,ARAG_EF,0x77,0x001000,0x19,ARAGONEU_EF_INSIGNIA,
           0x2000D,FAUR_EF,0x6F,0x002000,0x23,FAUREGANDI_EF_INSIGNIA,
           0x2000E,VALD_EF,0x70,0x004000,0x28,VALDEAUNIA_EF_INSIGNIA,
           0x2000F,QUFI_EF,0x7E,0x008000,0x19,QUFIM_EF_INSIGNIA,
           0x20010,LITE_EF,0x79,0x010000,0x23,LITELOR_EF_INSIGNIA,
           0x20011,KUZO_EF,0x72,0x020000,0x28,KUZOTZ_EF_INSIGNIA,
           0x20012,VOLL_EF,0x71,0x040000,0x41,VOLLBOW_EF_INSIGNIA,
           0x20013,ELLO_EF,0x7B,0x080000,0x23,ELSHIMO_LOWLANDS_EF_INSIGNIA,
           0x20014,ELUP_EF,0x7C,0x100000,0x2D,ELSHIMO_UPLANDS_EF_INSIGNIA};


---------------------------------
--
---------------------------------

function getRegionalConquestOverseers(region)

switch (region): caseof {
  ---------------------------------
  [RONFAURE] = function (x) -- West Ronfaure (100)
  ---------------------------------
    --print("RONFAURE");

    local Doladepaiton = 17187523;

    npc  = {
    --
        Doladepaiton,NATION_SANDORIA,        -- Doladepaiton, R.K.
        Doladepaiton+7,NATION_SANDORIA,    -- Ballie, R.K.
        Doladepaiton+3,NATION_SANDORIA,    -- Flag
        Doladepaiton+11,NATION_SANDORIA,    -- Flag
    --
        Doladepaiton+1,NATION_BASTOK,        -- Yoshihiro, I.M.
        Doladepaiton+8,NATION_BASTOK,        -- Molting Moth, I.M.
        Doladepaiton+4,NATION_BASTOK,        -- Flag
        Doladepaiton+13,NATION_BASTOK,        -- Flag
    --
        Doladepaiton+2,NATION_WINDURST,    -- Kyanta-Pakyanta, W.W.
        Doladepaiton+9,NATION_WINDURST,    -- Tottoto, W.W.
        Doladepaiton+5,NATION_WINDURST,    -- Flag
        Doladepaiton+13,NATION_WINDURST,    -- Flag
    --
        Doladepaiton+6,BEASTMEN,    -- Flag
        Doladepaiton+14,BEASTMEN,    -- Flag
    --
        Doladepaiton+10,OTHER,        -- Harvetour
    }
  end,

  ---------------------------------
  [ZULKHEIM] = function (x) -- Valkurm_Dunes (103)
  ---------------------------------
    --print("ZULKHEIM");

    local Quanteilleron = 17199707;

    npc  = {
    --
        Quanteilleron,NATION_SANDORIA,        -- Quanteilleron, R.K.
        Quanteilleron+7,NATION_SANDORIA,    -- Prunilla, R.K.
        Quanteilleron+3,NATION_SANDORIA,    -- flag
        Quanteilleron+12,NATION_SANDORIA,    -- flag
    --
        Quanteilleron+1,NATION_BASTOK,        -- Tsunashige, I.M.
        Quanteilleron+8,NATION_BASTOK,        -- Fighting Ant, I.M.
        Quanteilleron+4,NATION_BASTOK,        -- flag
        Quanteilleron+13,NATION_BASTOK,    -- flag
    --
        Quanteilleron+2,NATION_WINDURST,    -- Nyata-Mobuta, W.W.
        Quanteilleron+9,NATION_WINDURST,    -- Tebubu, W.W.
        Quanteilleron+5,NATION_WINDURST,    -- flag
        Quanteilleron+14,NATION_WINDURST,    -- flag
    --
        Quanteilleron+6,BEASTMEN,    -- flag
        Quanteilleron+15,BEASTMEN,    -- flag
    --
        Quanteilleron+10,OTHER,        -- Medicine Axe
    }
  end,

  ---------------------------------
  [NORVALLEN] = function (x) -- Jugner_Forest (104)
  ---------------------------------
    --print("NORVALLEN");

    local Chaplion = 17203857;

    npc  = {
    --
        Chaplion,NATION_SANDORIA,        -- Chaplion, R.K.
        Chaplion+7,NATION_SANDORIA,    -- Taumiale, R.K.
        Chaplion+3,NATION_SANDORIA,    -- flag
        Chaplion+11,NATION_SANDORIA,    -- flag
    --
        Chaplion+1,NATION_BASTOK,        -- Takamoto, I.M.
        Chaplion+8,NATION_BASTOK,        -- Pure Heart, I.M.
        Chaplion+4,NATION_BASTOK,        -- flag
        Chaplion+12,NATION_BASTOK,        -- flag
    --
        Chaplion+2,NATION_WINDURST,    -- Bubchu-Bibinchu, W.W.
        Chaplion+9,NATION_WINDURST,    -- Geruru, W.W.
        Chaplion+5,NATION_WINDURST,    -- flag
        Chaplion+13,NATION_WINDURST,    -- flag
    --
        Chaplion+6,BEASTMEN,    -- flag
        Chaplion+14,BEASTMEN,    -- flag
    --
        Chaplion+10,OTHER,        -- Mionie
    }
  end,

  ---------------------------------
  [GUSTABERG] = function (x) -- North_Gustaberg (106)
  ---------------------------------
    --print("GUSTABERG");

    local Ennigreaud = 17212058;

    npc  = {
    --
        Ennigreaud,NATION_SANDORIA,    -- Ennigreaud, R.K.
        Ennigreaud+7,NATION_SANDORIA,    -- Quellebie, R.K.
        Ennigreaud+3,NATION_SANDORIA,    -- flag
        Ennigreaud+11,NATION_SANDORIA,    -- flag
    --
        Ennigreaud+1,NATION_BASTOK,    -- Shigezane, I.M.
        Ennigreaud+8,NATION_BASTOK,    -- Heavy Fog, I.M.
        Ennigreaud+4,NATION_BASTOK,    -- flag
        Ennigreaud+12,NATION_BASTOK,    -- flag
    --
        Ennigreaud+2,NATION_WINDURST,    -- Kuuwari-Aori, W.W.
        Ennigreaud+9,NATION_WINDURST,    -- Butsutsu, W.W.
        Ennigreaud+5,NATION_WINDURST,    -- flag
        Ennigreaud+13,NATION_WINDURST,    -- flag
    --
        Ennigreaud+6,BEASTMEN,    -- flag
        Ennigreaud+14,BEASTMEN,    -- flag
    --
        Ennigreaud+10,OTHER,    -- Kuleo
    }
  end,

  ---------------------------------
  [DERFLAND] = function (x) -- Pashhow_Marshlands (109)
  ---------------------------------
    --print("DERFLAND");

    local Mesachedeau = 17224324;

    npc  = {
    --
        Mesachedeau,NATION_SANDORIA,        -- Mesachedeau, R.K.
        Mesachedeau+7,NATION_SANDORIA,        -- Ioupie, R.K.
        Mesachedeau+3,NATION_SANDORIA,        -- flag
        Mesachedeau+11,NATION_SANDORIA,    -- flag
    --
        Mesachedeau+1,NATION_BASTOK,        -- Souun, I.M.
        Mesachedeau+8,NATION_BASTOK,        -- Sharp Tooth, I.M.
        Mesachedeau+4,NATION_BASTOK,        -- flag
        Mesachedeau+12,NATION_BASTOK,        -- flag
    --
        Mesachedeau+2,NATION_WINDURST,        -- Mokto-Lankto, W.W.
        Mesachedeau+9,NATION_WINDURST,        -- Shikoko, W.W.
        Mesachedeau+5,NATION_WINDURST,        -- flag
        Mesachedeau+13,NATION_WINDURST,    -- flag
    --
        Mesachedeau+6,BEASTMEN,        -- flag
        Mesachedeau+14,BEASTMEN,    -- flag
    --
        Mesachedeau+10,OTHER,        -- Tahmasp
    }
  end,

  ---------------------------------
  [SARUTABARUTA] = function (x) -- West_Sarutabaruta (115)
  ---------------------------------
    --print("SARUTABARUTA");

    local Naguipeillont = 17248823;

    npc  = {
    --
        Naguipeillont,NATION_SANDORIA,        -- Naguipeillont, R.K.
        Naguipeillont+7,NATION_SANDORIA,    -- Banege, R.K.
        Naguipeillont+3,NATION_SANDORIA,    -- flag
        Naguipeillont+11,NATION_SANDORIA,    -- flag
    --
        Naguipeillont+1,NATION_BASTOK,        -- Ryokei, I.M.
        Naguipeillont+8,NATION_BASTOK,        -- Slow Axe, I.M.
        Naguipeillont+4,NATION_BASTOK,        -- flag
        Naguipeillont+12,NATION_BASTOK,    -- flag
    --
        Naguipeillont+2,NATION_WINDURST,    -- Roshina-Kuleshuna, W.W.
        Naguipeillont+9,NATION_WINDURST,    -- Darumomo, W.W.
        Naguipeillont+5,NATION_WINDURST,    -- flag
        Naguipeillont+13,NATION_WINDURST,    -- flag
    --
        Naguipeillont+6,BEASTMEN,    -- flag
        Naguipeillont+14,BEASTMEN,    -- flag
    --
        Naguipeillont+10,OTHER,        -- Mahien-Uhien
    }
  end,

  ---------------------------------
  [KOLSHUSHU] = function (x) -- Buburimu_Peninsula (118)
  ---------------------------------
    --print("KOLSHUSHU");

    local Bonbavour = 17261148;

    npc  = {
    --
        Bonbavour,NATION_SANDORIA,    -- Bonbavour, R.K.
        Bonbavour+7,NATION_SANDORIA,    -- Craigine, R.K.
        Bonbavour+3,NATION_SANDORIA,    -- flag
        Bonbavour+11,NATION_SANDORIA,    -- flag
    --
        Bonbavour+1,NATION_BASTOK,    -- Ishin, I.M.
        Bonbavour+8,NATION_BASTOK,    -- Wise Turtle, I.M.
        Bonbavour+4,NATION_BASTOK,    -- flag
        Bonbavour+12,NATION_BASTOK,    -- flag
    --
        Bonbavour+2,NATION_WINDURST,    -- Ganemu-Punnemu, W.W.
        Bonbavour+9,NATION_WINDURST,    -- Mashasha, W.W.
        Bonbavour+5,NATION_WINDURST,    -- flag
        Bonbavour+13,NATION_WINDURST,    -- flag
    --
        Bonbavour+6,BEASTMEN,    -- flag
        Bonbavour+14,BEASTMEN,    -- flag
    --
        Bonbavour+10,OTHER,        -- Lobho Ukipturi
    }
  end,

  ---------------------------------
  [ARAGONEU] = function (x) -- Meriphataud_Mountains (119)
  ---------------------------------
    --print("ARAGONEU");

    local Chegourt = 17265269;

    npc  = {
    --
        Chegourt,NATION_SANDORIA,    -- Chegourt, R.K.
        Chegourt+7,NATION_SANDORIA,    -- Buliame, R.K.
        Chegourt+3,NATION_SANDORIA,    -- flag
        Chegourt+11,NATION_SANDORIA,    -- flag
    --
        Chegourt+1,NATION_BASTOK,    -- Akane, I.M.
        Chegourt+8,NATION_BASTOK,    -- Three Steps, I.M.
        Chegourt+4,NATION_BASTOK,    -- flag
        Chegourt+12,NATION_BASTOK,    -- flag
    --
        Chegourt+2,NATION_WINDURST,    -- Donmo-Boronmo, W.W.
        Chegourt+9,NATION_WINDURST,    -- Daruru, W.W.
        Chegourt+5,NATION_WINDURST,    -- flag
        Chegourt+13,NATION_WINDURST,    -- flag
    --
        Chegourt+6,BEASTMEN,    -- flag
        Chegourt+14,BEASTMEN,    -- flag
    --
        Chegourt+10,OTHER,        -- Mushosho
    }
  end,

  ---------------------------------
  [FAUREGANDI] = function (x) -- Beaucedine_Glacier (111)
  ---------------------------------
    --print("FAUREGANDI");

    local Parledaire = 17232207;

    npc  = {
    --
        Parledaire,NATION_SANDORIA,        -- Parledaire, R.K.
        Parledaire+7,NATION_SANDORIA,        -- Leaufetie, R.K.
        Parledaire+3,NATION_SANDORIA,        -- flag
        Parledaire+11,NATION_SANDORIA,        -- flag
    --
        Parledaire+1,NATION_BASTOK,        -- Akane, I.M.
        Parledaire+8,NATION_BASTOK,        -- Rattling Rain, I.M.
        Parledaire+4,NATION_BASTOK,        -- flag
        Parledaire+12,NATION_BASTOK,        -- flag
    --
        Parledaire+2,NATION_WINDURST,        -- Ryunchi-Pauchi, W.W.
        Parledaire+9,NATION_WINDURST,        -- Chopapa, W.W.
        Parledaire+5,NATION_WINDURST,        -- flag
        Parledaire+13,NATION_WINDURST,        -- flag
    --
        Parledaire+6,BEASTMEN,        -- flag
        Parledaire+14,BEASTMEN,        -- flag
    --
        Parledaire+10,OTHER,        -- Gueriette
    }
  end,

  ---------------------------------
  [VALDEAUNIA] = function (x) -- Xarcabard (112)
  ---------------------------------
    --print("VALDEAUNIA");

    local Jeantelas = 17236288;

    npc  = {
    --
        Jeantelas,NATION_SANDORIA,            -- Jeantelas, R.K.
        Jeantelas+7,NATION_SANDORIA,        -- Pilcha, R.K.
        Jeantelas+3,NATION_SANDORIA,        -- flag
        Jeantelas+11,NATION_SANDORIA,        -- flag
    --
        Jeantelas+1,NATION_BASTOK,            -- Kaya, I.M.
        Jeantelas+8,NATION_BASTOK,            -- Heavy Bear, I.M.
        Jeantelas+4,NATION_BASTOK,            -- flag
        Jeantelas+12,NATION_BASTOK,        -- flag
    --
        Jeantelas+2,NATION_WINDURST,        -- Magumo-Yagimo, W.W.
        Jeantelas+9,NATION_WINDURST,        -- Tememe, W.W.
        Jeantelas+5,NATION_WINDURST,        -- flag
        Jeantelas+13,NATION_WINDURST,        -- flag
    --
        Jeantelas+6,BEASTMEN,        -- flag
        Jeantelas+14,BEASTMEN,        -- flag
    --
        Jeantelas+10,OTHER,            -- Pelogrant
    }
  end,

  ---------------------------------
  [QUFIMISLAND] = function (x) -- Qufim_Island (126)
  ---------------------------------
    --print("QUFIMISLAND");

    local Pitoire = 17293714;

    npc  = {
    --
        Pitoire,NATION_SANDORIA,    -- Pitoire, R.K.
        Pitoire+7,NATION_SANDORIA,    -- Matica, R.K.
        Pitoire+3,NATION_SANDORIA,    -- flag
        Pitoire+11,NATION_SANDORIA,    -- flag
    --
        Pitoire+1,NATION_BASTOK,    -- Sasa, I.M.
        Pitoire+8,NATION_BASTOK,    -- Singing Blade, I.M.
        Pitoire+4,NATION_BASTOK,    -- flag
        Pitoire+12,NATION_BASTOK,    -- flag
    --
        Pitoire+2,NATION_WINDURST,    -- Tsonga-Hoponga, W.W.
        Pitoire+9,NATION_WINDURST,    -- Numumu, W.W.
        Pitoire+5,NATION_WINDURST,    -- flag
        Pitoire+13,NATION_WINDURST,    -- flag
    --
        Pitoire+6,BEASTMEN,    -- flag
        Pitoire+14,BEASTMEN,    -- flag
    --
        Pitoire+10,OTHER,        -- Jiwon
    }
  end,

  ---------------------------------
  [LITELOR] = function (x) -- The_Sanctuary_of_ZiTah (121)
  ---------------------------------
    --print("LITELOR");

    local Credaurion = 17273363;

    npc  = {
    --
        Credaurion,NATION_SANDORIA,        -- Credaurion, R.K.
        Credaurion+7,NATION_SANDORIA,        -- Limion, R.K.
        Credaurion+3,NATION_SANDORIA,        -- flag
        Credaurion+11,NATION_SANDORIA,        -- flag
    --
        Credaurion+1,NATION_BASTOK,        -- Calliope, I.M.
        Credaurion+8,NATION_BASTOK,        -- Dedden, I.M.
        Credaurion+4,NATION_BASTOK,        -- flag
        Credaurion+12,NATION_BASTOK,        -- flag
    --
        Credaurion+2,NATION_WINDURST,        -- Ajimo-Majimo, W.W.
        Credaurion+9,NATION_WINDURST,        -- Ochocho, W.W.
        Credaurion+5,NATION_WINDURST,        -- flag
        Credaurion+13,NATION_WINDURST,        -- flag
    --
        Credaurion+6,BEASTMEN,        -- flag
        Credaurion+14,BEASTMEN,        -- flag
    --
        Credaurion+10,OTHER,        -- Kasim
    }
  end,

  ---------------------------------
  [KUZOTZ] = function (x) -- Eastern_Altepa_Desert (114)
  ---------------------------------
    --print("KUZOTZ");

    local Eaulevisat = 17244625;

    npc  = {
    --
        Eaulevisat,NATION_SANDORIA,    -- Eaulevisat, R.K.
        Eaulevisat+7,NATION_SANDORIA,    -- Laimeve, R.K.
        Eaulevisat+3,NATION_SANDORIA,    -- flag
        Eaulevisat+11,NATION_SANDORIA,    -- flag
    --
        Eaulevisat+1,NATION_BASTOK,    -- Lindgard, I.M.
        Eaulevisat+8,NATION_BASTOK,    -- Daborn, I.M.
        Eaulevisat+4,NATION_BASTOK,    -- flag
        Eaulevisat+12,NATION_BASTOK,    -- flag
    --
        Eaulevisat+2,NATION_WINDURST,    -- Variko-Njariko, W.W.
        Eaulevisat+9,NATION_WINDURST,    -- Sahgygy, W.W.
        Eaulevisat+5,NATION_WINDURST,    -- flag
        Eaulevisat+13,NATION_WINDURST,    -- flag
    --
        Eaulevisat+6,BEASTMEN,    -- flag
        Eaulevisat+14,BEASTMEN,    -- flag
    --
        Eaulevisat+10,OTHER,    -- Sowande
    }
  end,

  ---------------------------------
  [VOLLBOW] = function (x) -- Cape_Teriggan (113)
  ---------------------------------
    --print("VOLLBOW");

    local Salimardi = 17240472;

    npc  = {
    --
        Salimardi,NATION_SANDORIA,    -- Salimardi, R.K.
        Salimardi+7,NATION_SANDORIA,    -- Paise, R.K.
        Salimardi+3,NATION_SANDORIA,    -- flag
        Salimardi+11,NATION_SANDORIA,    -- flag
    --
        Salimardi+1,NATION_BASTOK,    -- Sarmistha, I.M.
        Salimardi+8,NATION_BASTOK,    -- Dultwa, I.M.
        Salimardi+4,NATION_BASTOK,    -- flag
        Salimardi+12,NATION_BASTOK,    -- flag
    --
        Salimardi+2,NATION_WINDURST,    -- Voranbo-Natanbo, W.W.
        Salimardi+9,NATION_WINDURST,    -- Orukeke, W.W.
        Salimardi+5,NATION_WINDURST,    -- flag
        Salimardi+13,NATION_WINDURST,    -- flag
    --
        Salimardi+6,BEASTMEN,    -- flag
        Salimardi+14,BEASTMEN,    -- flag
    --
        Salimardi+10,OTHER,        -- Bright Moon
    }
  end,

  ---------------------------------
  [ELSHIMOLOWLANDS] = function (x) -- Yuhtunga_Jungle (123)
  ---------------------------------
    --print("ELSHIMOLOWLANDS");

    local Zorchorevi = 17281598;

    npc  = {
    --
        Zorchorevi,NATION_SANDORIA,    -- Zorchorevi, R.K.
        Zorchorevi+7,NATION_SANDORIA,    -- Mupia, R.K.
        Zorchorevi+3,NATION_SANDORIA,    -- flag
        Zorchorevi+11,NATION_SANDORIA,    -- flag
    --
        Zorchorevi+1,NATION_BASTOK,    -- Mahol, I.M.
        Zorchorevi+8,NATION_BASTOK,    -- Bammiro, I.M.
        Zorchorevi+4,NATION_BASTOK,    -- flag
        Zorchorevi+12,NATION_BASTOK,    -- flag
    --
        Zorchorevi+2,NATION_WINDURST,    -- Uphra-Kophra, W.W.
        Zorchorevi+9,NATION_WINDURST,    -- Richacha, W.W.
        Zorchorevi+5,NATION_WINDURST,    -- flag
        Zorchorevi+13,NATION_WINDURST,    -- flag
    --
        Zorchorevi+6,BEASTMEN,    -- flag
        Zorchorevi+14,BEASTMEN,    -- flag
    --
        Zorchorevi+10,OTHER,        -- Robino-Mobino
    }
  end,

  ---------------------------------
  [ELSHIMOUPLANDS] = function (x) -- Yhoator_Jungle (124)
  ---------------------------------
    --print("ELSHIMOUPLANDS");

    local Ilieumort = 17285648;

    npc  ={
    --
        Ilieumort,NATION_SANDORIA,        -- Ilieumort, R.K.
        Ilieumort+7,NATION_SANDORIA,    -- Emila, R.K.
        Ilieumort+3,NATION_SANDORIA,    -- flag
        Ilieumort+11,NATION_SANDORIA,    -- flag
    --
        Ilieumort+1,NATION_BASTOK,        -- Mintoo, I.M.
        Ilieumort+8,NATION_BASTOK,        -- Guddal, I.M.
        Ilieumort+4,NATION_BASTOK,        -- flag
        Ilieumort+12,NATION_BASTOK,    -- flag
    --
        Ilieumort+2,NATION_WINDURST,    -- Etaj-Pohtaj, W.W.
        Ilieumort+9,NATION_WINDURST,    -- Ghantata, W.W.
        Ilieumort+5,NATION_WINDURST,    -- flag
        Ilieumort+13,NATION_WINDURST,    -- flag
    --
        Ilieumort+6,BEASTMEN,    -- flag
        Ilieumort+14,BEASTMEN,    -- flag
    --
        Ilieumort+10,OTHER,        -- Mugha Dovajaiho
    }
  end,

  ---------------------------------
  [TULIA] = function (x) -- RuAun_Gardens (130)
  ---------------------------------
    --print("TULIA");

    local RuAun_Banner = 17310080;

    npc  = {
    --
        RuAun_Banner,NATION_SANDORIA,        -- flag
    --
        RuAun_Banner+1,NATION_BASTOK,        -- flag
    --
        RuAun_Banner+2,NATION_WINDURST,    -- flag
    --
        RuAun_Banner+3,BEASTMEN,    -- flag
    }
  end,

  ---------------------------------
  [MOVALPOLOS] = function (x) -- Oldton_Movalpolos
  ---------------------------------
    --print("MOVALPOLOS");

    local Oldton_Banner_Offset = 16822509;

    npc  = {
    --
        Oldton_Banner_Offset,NATION_SANDORIA,        -- flag
    --
        Oldton_Banner_Offset+1,NATION_BASTOK,        -- flag
    --
        Oldton_Banner_Offset+2,NATION_WINDURST,    -- flag
    --
        Oldton_Banner_Offset+3,BEASTMEN,    -- flag
    }
  end,

  ---------------------------------
  [TAVNAZIANARCH] = function (x) -- Lufaise_Meadows
  ---------------------------------
    --print("TAVNAZIA");

    local Jemmoquel = 16875865;

    npc  = {
    --
        Jemmoquel,NATION_SANDORIA,        -- Jemmoquel, R.K.
        Jemmoquel+7,NATION_SANDORIA,    -- Chilaumme, R.K.
        Jemmoquel+3,NATION_SANDORIA,    -- flag
        Jemmoquel+11,NATION_SANDORIA,    -- flag
    --
        Jemmoquel+1,NATION_BASTOK,        -- Yoram, I.M.
        Jemmoquel+8,NATION_BASTOK,        -- Ghost Talker, I.M.
        Jemmoquel+4,NATION_BASTOK,        -- flag
        Jemmoquel+12,NATION_BASTOK,    -- flag
    --
        Jemmoquel+2,NATION_WINDURST,    -- Teldo-Moroldo, W.W.
        Jemmoquel+9,NATION_WINDURST,    -- Cotete, W.W.
        Jemmoquel+5,NATION_WINDURST,    -- flag
        Jemmoquel+13,NATION_WINDURST,    -- flag
    --
        Jemmoquel+6,BEASTMEN,    -- flag
        Jemmoquel+14,BEASTMEN,    -- flag
    --
        Jemmoquel+10,OTHER,        -- Jersey
    }
  end,
  }

 return npc;
end;

-----------------------------------
--
-----------------------------------

function SetRegionalConquestOverseers(region)

    local npclist = getRegionalConquestOverseers(region);
    local nation  = GetRegionOwner(region);

    for i = 1, #npclist, 2 do
        local npc = GetNPCByID(npclist[i]);

        if (npc ~= nil) then
            if (npclist[i+1] == nation) then
                npc:setStatus(0);
            else
                npc:setStatus(2);
            end

            if (npclist[i+1] == OTHER) then
                if (nation ~= BEASTMEN) then
                    npc:setStatus(0);
                else
                    npc:setStatus(2);
                end
            end
    end
    end
end;

-----------------------------------
-- checkConquestRing
-----------------------------------

function checkConquestRing(player)
   local count = 0;

   -- If not enabled by admin, do a count on Chariot, Empress, and Emperor Band
   if (ALLOW_MULTIPLE_EXP_RINGS ~= 1) then
      for i=15761,15763 do
         if (player:hasItem(i) == true) then
            count = count + 1;
         end
      end
   end

   -- One exp ring purchasable per conquest tally
   if (BYPASS_EXP_RING_ONE_PER_WEEK ~= 1 and player:getVar("CONQUEST_RING_TIMER") > os.time()) then
      count = 3;
   end

   return count;
end;

-----------------------------------
-- conquestUpdate
-----------------------------------

function conquestUpdate(zone, player, updateType, messageBase)

    local ranking = getConquestBalance();

    if (updateType == CONQUEST_TALLY_START) then
        player:messageText(player, messageBase, 5);
    elseif (updateType == CONQUEST_TALLY_END) then
        --Tallying conquest results...
        player:messageText(player, messageBase+1, 5);
        -- This region is currently under x control.
        local owner = GetRegionOwner(zone:getRegionID());
        if (owner <= 3) then
            player:messageText(player, messageBase+2+owner, 5);
        else
            player:messageText(player, messageBase+6, 5);
        end

        local offset = 0;
        if (bit.band(ranking, 0x03) == 0x01) then
            offset = offset + 7; -- 7
            if (bit.band(ranking, 0x30) == 0x10) then
                offset = offset + 1; -- 8
                if (bit.band(ranking, 0x0C) == 0x0C) then
                    offset = offset + 1; -- 9
                end
            elseif (bit.band(ranking, 0x0C) == 0x08) then
                offset = offset + 3; -- 10
                if (bit.band(ranking, 0x30) == 0x30) then
                    offset = offset + 1; -- 11
                end
            elseif (bit.band(ranking, 0x0C) == 0x04) then
                offset = offset + 6; -- 13
            end
        elseif (bit.band(ranking, 0x0C) == 0x04) then
            offset = offset + 15; -- 15
            if (bit.band(ranking, 0x30) == 0x02) then
                offset = offset + 3; -- 18
                if (bit.band(ranking, 0x03) == 0x03) then
                    offset = offset + 1; -- 19
                end
            elseif (bit.band(ranking, 0x30) == 0x10) then
                offset = offset + 6; -- 21
            end
        elseif (bit.band(ranking, 0x30) == 0x10) then
            offset = offset + 23; -- 23
            if (bit.band(ranking, 0x0C) == 0x08) then
                offset = offset + 3; -- 26
                if (bit.band(ranking, 0x30) == 0x30) then
                    offset = offset + 1; -- 27
                end
            end
        end
        -- Global balance of power:
        player:messageText(player, messageBase+offset, 5);

        if (isConquestAlliance()) then
            -- have formed an alliance.
            if (bit.band(ranking, 0x03) == 0x01) then
                player:messageText(player, messageBase+50, 5);
            elseif (bit.band(ranking, 0x0C) == 0x04) then
                player:messageText(player, messageBase+51, 5);
            elseif (bit.band(ranking, 0x30) == 0x10) then
                player:messageText(player, messageBase+52, 5);
            end
        end
    elseif (updateType == CONQUEST_UPDATE) then
        -- Conquest update: This region is currently under x control.
        local owner = GetRegionOwner(zone:getRegionID());
        if (owner <= 3) then
            player:messageText(player, messageBase+32+owner, 5);
        else
            player:messageText(player, messageBase+31, 5);
        end

        local influence = GetRegionInfluence(zone:getRegionID());

        if (influence >= 64) then
            -- The beastmen are on the rise.
            player:messageText(player, messageBase+37, 5);
        elseif (influence == 0) then
            -- All three nations are at a deadlock.
            player:messageText(player, messageBase+36, 5);
        else
            local sandoria = bit.band(influence, 0x03);
            local bastok = bit.rshift(bit.band(influence, 0x0C),2);
            local windurst = bit.rshift(bit.band(influence, 0x30),4);

            -- Regional influence: San d'Oria
            player:messageText(player, messageBase+41 - sandoria, 5);
            -- Bastok
            player:messageText(player, messageBase+45 - bastok, 5);
            -- Windurst
            player:messageText(player, messageBase+49 - windurst, 5);
        end

        if (isConquestAlliance()) then
            --are currently allied.
            if (bit.band(ranking, 0x03) == 0x01) then
                player:messageText(player, messageBase+53, 5);
            elseif (bit.band(ranking, 0x0C) == 0x04) then
                player:messageText(player, messageBase+54, 5);
            elseif (bit.band(ranking, 0x30) == 0x10) then
                player:messageText(player, messageBase+55, 5);
            end
        end
    end
end;
