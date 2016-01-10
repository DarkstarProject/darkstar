-----------------------------------
-- Area: Norg
--  NPC: Deigoff
-- Standard Info NPC
-----------------------------------

package.loaded["scripts/zones/Norg/TextIDs"] = nil;

require("scripts/zones/Norg/TextIDs");
require("scripts/globals/pathfind");

local path = {
-15.048376, -1.476800, 30.425398,
-15.526757, -1.225124, 29.480957,
-14.723476, -1.423349, 30.104301,
-13.893593, -1.648318, 30.828171,
-12.975020, -1.871566, 31.517338,
-12.044265, -2.053941, 31.966581,
-11.003557, -2.393157, 32.302952,
-9.985520, -2.708733, 32.557224,
-8.916955, -3.017504, 32.716526,
-7.803241, -3.231221, 32.842529,
-6.703550, -3.548066, 32.933296,
-2.621637, -4.728867, 33.234219,
-3.692678, -4.392691, 33.156784,
-4.784571, -4.086610, 33.078362,
-7.672429, -3.273804, 32.870365,
-8.728366, -3.020066, 32.775761,
-9.767247, -2.778361, 32.601532,
-10.786559, -2.469297, 32.379894,
-11.791664, -2.154150, 32.110737,
-12.739241, -1.916063, 31.632357,
-13.613935, -1.713264, 31.018566,
-14.453866, -1.501245, 30.353886,
-15.187916, -1.273126, 29.586229,
-15.810313, -1.031864, 28.727566,
-16.338600, -0.821452, 27.804821,
-16.721289, -0.631609, 26.800562,
-17.015059, -0.430842, 25.772522,
-17.276829, -0.226373, 24.724413,
-17.057823, -0.418425, 25.708294,
-16.776665, -0.621304, 26.739079,
-16.362362, -0.804862, 27.727364,
-15.858993, -1.014936, 28.676291,
-15.207123, -1.261934, 29.550617,
-14.408654, -1.502193, 30.350636,
-13.596487, -1.725003, 31.070555,
-12.709093, -1.926028, 31.662998,
-11.711613, -2.167211, 32.087074,
-10.711581, -2.485834, 32.386322,
-9.675041, -2.801156, 32.616379,
-8.606792, -3.039549, 32.759628,
-7.521237, -3.312841, 32.868916,
-6.463308, -3.617169, 32.952408,
-2.352002, -4.875265, 33.252991,
-3.373222, -4.489793, 33.181557,
-8.309618, -3.099132, 32.823685,
-9.346218, -2.897947, 32.683289,
-10.356988, -2.596533, 32.481487,
-11.362209, -2.289157, 32.248039,
-12.344488, -1.993539, 31.858101,
-13.248831, -1.799422, 31.288286,
-14.096587, -1.592161, 30.646973,
-14.883204, -1.374069, 29.931999,
-15.547549, -1.137073, 29.104630,
-16.128418, -0.943367, 28.213142,
-16.578665, -0.713513, 27.230043,
-16.879889, -0.529637, 26.273342,
-17.146322, -0.330673, 25.258379,
-17.403625, -0.115268, 24.211039
};

function onSpawn(npc)
    npc:initNpcAi();
    npc:setPos(pathfind.first(path));
    -- onPath(npc);
end;

function onPath(npc)
    pathfind.patrol(npc, path);
end;

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(0x0056);
npc:wait(-1);
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option,npc)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    npc:wait(0);
end;
