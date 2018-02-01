-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Alphollon C Meriard
-- Type: Purifies cursed items with their corresponding abjurations.
-- @zone 231
-- !pos 98.108 -1 137.999
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Northern_San_dOria/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
    if (trade:getItemCount() == 2) then
        local item = 0;
        local reward = 0;
        local abjurList =
        {
            -- Abjuration, item, item -1, reward, reward +1 (5 ID's per transaction)
            1314,1344,1345,13934,13935,    1315,1346,1347,14387,14388,
            1316,1348,1349,14821,14822,    1317,1350,1351,14303,14304,
            1318,1352,1353,14184,14185,    1319,1354,1355,12429,13924,
            1320,1356,1357,12557,14371,    1321,1358,1359,12685,14816,
            1322,1360,1361,12813,14296,    1323,1362,1363,12941,14175,
            1324,1364,1365,13876,13877,    1325,1366,1367,13787,13788,
            1326,1368,1369,14006,14007,    1327,1370,1371,14247,14248,
            1328,1372,1373,14123,14124,    1329,1374,1375,12421,13911,
            1330,1376,1377,12549,14370,    1331,1378,1379,12677,14061,
            1332,1380,1381,12805,14283,    1333,1382,1383,12933,14163,
            1334,1384,1385,13908,13909,    1335,1386,1387,14367,14368,
            1336,1388,1389,14058,14059,    1337,1390,1391,14280,14281,
            1338,1392,1393,14160,14161,    1339,1394,1395,13927,13928,
            1340,1396,1397,14378,14379,    1341,1398,1399,14076,14077,
            1342,1400,1401,14308,14309,    1343,1402,1403,14180,14181,
            2429,2439,2440,16113,16114,    2430,2441,2442,14573,14574,
            2431,2443,2444,14995,14996,    2432,2445,2446,15655,15656,
            2433,2447,2448,15740,15741,    2434,2449,2450,16115,16116,
            2435,2451,2452,14575,14576,    2436,2453,2454,14997,14998,
            2437,2455,2456,15657,15658,    2438,2457,2458,15742,15743,
            1441,4234,4234,4513,4513,      1442,4235,4235,4511,4511
        };
        for i = 1,#abjurList,5 do
            if (trade:hasItemQty(abjurList[i],1)) then
                if (trade:hasItemQty(abjurList[i + 1],1)) then
                    item = abjurList[i + 1];
                    reward = abjurList[i + 3];
                elseif (trade:hasItemQty(abjurList[i + 2],1)) then
                    item = abjurList[i + 2];
                    reward = abjurList[i + 4];
                end
                break;
            end
        end

        if (reward ~= 0) then
            --Trade pair for a nice reward.
            player:startEvent(720,item,reward);
            player:setVar("reward",reward);
        end
    end
end;

function onTrigger(player,npc)
    player:startEvent(719);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 720) then
        local reward = player:getVar("reward");
        if (reward ~= 0) then
            player:tradeComplete();
            player:addItem(reward);
            player:setVar("reward",0);
            player:messageSpecial(ITEM_OBTAINED,reward);
        end
    end
end;
