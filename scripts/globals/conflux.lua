-----------------------------------
-- This file contains functions and
-- data related to using Veridical
-- Confluxes in Abyssea - Originally By Troak
-----------------------------------

require("scripts/globals/common");
require("scripts/globals/settings");
require("scripts/globals/keyitems");

-----------------------------------

-- {   npcid, zoneid, bit, csid, { #01,  #02,  #03,  #04,  #05,  #06,  #07,  #08}, mask variable}
    ConfluxData =
    {
        16839194, 15, 0, 0x0854, { 50, 100, 150, 200, 250, 300, 350, 400}, 'ConfluxMask[Konschtat]',
        16839195, 15, 1, 0x0855, { 50, 100, 150, 200, 250, 300, 350, 400}, 'ConfluxMask[Konschtat]',
        16839196, 15, 2, 0x0856, { 50, 100, 150, 200, 250, 300, 350, 400}, 'ConfluxMask[Konschtat]',
        16839197, 15, 3, 0x0857, { 50, 100, 150, 200, 250, 300, 350, 400}, 'ConfluxMask[Konschtat]',
        16839198, 15, 4, 0x0858, { 50, 100, 150, 200, 250, 300, 350, 400}, 'ConfluxMask[Konschtat]',
        16839199, 15, 5, 0x0859, { 50, 100, 150, 200, 250, 300, 350, 400}, 'ConfluxMask[Konschtat]',
        16839200, 15, 6, 0x085a, { 50, 100, 150, 200, 250, 300, 350, 400}, 'ConfluxMask[Konschtat]',
        16839201, 15, 7, 0x085b, { 50, 100, 150, 200, 250, 300, 350, 400}, 'ConfluxMask[Konschtat]',
        16962071, 45, 0, 0x0854, { 50, 100, 150, 200, 250, 300, 350, 400}, 'ConfluxMask[Tahrongi]',
        16962072, 45, 1, 0x0855, { 50, 100, 150, 200, 250, 300, 350, 400}, 'ConfluxMask[Tahrongi]',
        16962073, 45, 2, 0x0856, { 50, 100, 150, 200, 250, 300, 350, 400}, 'ConfluxMask[Tahrongi]',
        16962074, 45, 3, 0x0857, { 50, 100, 150, 200, 250, 300, 350, 400}, 'ConfluxMask[Tahrongi]',
        16962075, 45, 4, 0x0858, { 50, 100, 150, 200, 250, 300, 350, 400}, 'ConfluxMask[Tahrongi]',
        16962076, 45, 5, 0x0859, { 50, 100, 150, 200, 250, 300, 350, 400}, 'ConfluxMask[Tahrongi]',
        16962077, 45, 6, 0x085a, { 50, 100, 150, 200, 250, 300, 350, 400}, 'ConfluxMask[Tahrongi]',
        16962078, 45, 7, 0x085b, { 50, 100, 150, 200, 250, 300, 350, 400}, 'ConfluxMask[Tahrongi]',
        17318589, 132, 0, 0x0854, { 50, 100, 150, 200, 250, 300, 350, 400}, 'ConfluxMask[LaTheine]',
        17318590, 132, 1, 0x0855, { 50, 100, 150, 200, 250, 300, 350, 400}, 'ConfluxMask[LaTheine]',
        17318591, 132, 2, 0x0856, { 50, 100, 150, 200, 250, 300, 350, 400}, 'ConfluxMask[LaTheine]',
        17318592, 132, 3, 0x0857, { 50, 100, 150, 200, 250, 300, 350, 400}, 'ConfluxMask[LaTheine]',
        17318593, 132, 4, 0x0858, { 50, 100, 150, 200, 250, 300, 350, 400}, 'ConfluxMask[LaTheine]',
        17318594, 132, 5, 0x0859, { 50, 100, 150, 200, 250, 300, 350, 400}, 'ConfluxMask[LaTheine]',
        17318595, 132, 6, 0x085a, { 50, 100, 150, 200, 250, 300, 350, 400}, 'ConfluxMask[LaTheine]',
        17318596, 132, 7, 0x085b, { 50, 100, 150, 200, 250, 300, 350, 400}, 'ConfluxMask[LaTheine]',
        17658470, 215, 0, 0x0854, { 200, 400, 600, 800, 1000, 1200, 1400, 1600}, 'ConfluxMask[Attohwa]',
        17658471, 215, 1, 0x0855, { 200, 400, 600, 800, 1000, 1200, 1400, 1600}, 'ConfluxMask[Attohwa]',
        17658472, 215, 2, 0x0856, { 200, 400, 600, 800, 1000, 1200, 1400, 1600}, 'ConfluxMask[Attohwa]',
        17658473, 215, 3, 0x0857, { 200, 400, 600, 800, 1000, 1200, 1400, 1600}, 'ConfluxMask[Attohwa]',
        17658474, 215, 4, 0x0858, { 200, 400, 600, 800, 1000, 1200, 1400, 1600}, 'ConfluxMask[Attohwa]',
        17658475, 215, 5, 0x0859, { 200, 400, 600, 800, 1000, 1200, 1400, 1600}, 'ConfluxMask[Attohwa]',
        17658476, 215, 6, 0x085a, { 200, 400, 600, 800, 1000, 1200, 1400, 1600}, 'ConfluxMask[Attohwa]',
        17658477, 215, 7, 0x085b, { 200, 400, 600, 800, 1000, 1200, 1400, 1600}, 'ConfluxMask[Attohwa]',
        17658489, 215, 8, 0x007b, { 200, 400, 600, 800, 1000, 1200, 1400, 1600}, 'ConfluxMask[Attohwa]',
        17662675, 216, 0, 0x0854, { 200, 400, 600, 800, 1000, 1200, 1400, 1600}, 'ConfluxMask[Misareaux]',
        17662676, 216, 1, 0x0855, { 200, 400, 600, 800, 1000, 1200, 1400, 1600}, 'ConfluxMask[Misareaux]',
        17662677, 216, 2, 0x0856, { 200, 400, 600, 800, 1000, 1200, 1400, 1600}, 'ConfluxMask[Misareaux]',
        17662678, 216, 3, 0x0857, { 200, 400, 600, 800, 1000, 1200, 1400, 1600}, 'ConfluxMask[Misareaux]',
        17662679, 216, 4, 0x0858, { 200, 400, 600, 800, 1000, 1200, 1400, 1600}, 'ConfluxMask[Misareaux]',
        17662680, 216, 5, 0x0859, { 200, 400, 600, 800, 1000, 1200, 1400, 1600}, 'ConfluxMask[Misareaux]',
        17662681, 216, 6, 0x085a, { 200, 400, 600, 800, 1000, 1200, 1400, 1600}, 'ConfluxMask[Misareaux]',
        17662682, 216, 7, 0x085b, { 200, 400, 600, 800, 1000, 1200, 1400, 1600}, 'ConfluxMask[Misareaux]',
        17662694, 216, 8, 0x007b, { 200, 400, 600, 800, 1000, 1200, 1400, 1600}, 'ConfluxMask[Misareaux]',
        17666695, 217, 0, 0x0854, { 200, 400, 600, 800, 1000, 1200, 1400, 1600}, 'ConfluxMask[Vunkerl]',
        17666696, 217, 1, 0x0855, { 200, 400, 600, 800, 1000, 1200, 1400, 1600}, 'ConfluxMask[Vunkerl]',
        17666697, 217, 2, 0x0856, { 200, 400, 600, 800, 1000, 1200, 1400, 1600}, 'ConfluxMask[Vunkerl]',
        17666698, 217, 3, 0x0857, { 200, 400, 600, 800, 1000, 1200, 1400, 1600}, 'ConfluxMask[Vunkerl]',
        17666699, 217, 4, 0x0858, { 200, 400, 600, 800, 1000, 1200, 1400, 1600}, 'ConfluxMask[Vunkerl]',
        17666700, 217, 5, 0x0859, { 200, 400, 600, 800, 1000, 1200, 1400, 1600}, 'ConfluxMask[Vunkerl]',
        17666701, 217, 6, 0x085a, { 200, 400, 600, 800, 1000, 1200, 1400, 1600}, 'ConfluxMask[Vunkerl]',
        17666702, 217, 7, 0x085b, { 200, 400, 600, 800, 1000, 1200, 1400, 1600}, 'ConfluxMask[Vunkerl]',
        17666714, 217, 8, 0x007b, { 200, 400, 600, 800, 1000, 1200, 1400, 1600}, 'ConfluxMask[Vunkerl]',
        17670707, 218, 0, 0x0854, { 600, 800, 1000, 1200, 1400, 1600, 1800, 2000}, 'ConfluxMask[Altepa]',
        17670708, 218, 1, 0x0855, { 600, 800, 1000, 1200, 1400, 1600, 1800, 2000}, 'ConfluxMask[Altepa]',
        17670709, 218, 2, 0x0856, { 600, 800, 1000, 1200, 1400, 1600, 1800, 2000}, 'ConfluxMask[Altepa]',
        17670710, 218, 3, 0x0857, { 600, 800, 1000, 1200, 1400, 1600, 1800, 2000}, 'ConfluxMask[Altepa]',
        17670711, 218, 4, 0x0858, { 600, 800, 1000, 1200, 1400, 1600, 1800, 2000}, 'ConfluxMask[Altepa]',
        17670712, 218, 5, 0x0859, { 600, 800, 1000, 1200, 1400, 1600, 1800, 2000}, 'ConfluxMask[Altepa]',
        17670713, 218, 6, 0x085a, { 600, 800, 1000, 1200, 1400, 1600, 1800, 2000}, 'ConfluxMask[Altepa]',
        17670714, 218, 7, 0x085b, { 600, 800, 1000, 1200, 1400, 1600, 1800, 2000}, 'ConfluxMask[Altepa]',
        17814067, 253, 0, 0x0854, { 600, 800, 1000, 1200, 1400, 1600, 1800, 2000}, 'ConfluxMask[Uleguerand]',
        17814068, 253, 1, 0x0855, { 600, 800, 1000, 1200, 1400, 1600, 1800, 2000}, 'ConfluxMask[Uleguerand]',
        17814069, 253, 2, 0x0856, { 600, 800, 1000, 1200, 1400, 1600, 1800, 2000}, 'ConfluxMask[Uleguerand]',
        17814070, 253, 3, 0x0857, { 600, 800, 1000, 1200, 1400, 1600, 1800, 2000}, 'ConfluxMask[Uleguerand]',
        17814071, 253, 4, 0x0858, { 600, 800, 1000, 1200, 1400, 1600, 1800, 2000}, 'ConfluxMask[Uleguerand]',
        17814072, 253, 5, 0x0859, { 600, 800, 1000, 1200, 1400, 1600, 1800, 2000}, 'ConfluxMask[Uleguerand]',
        17814073, 253, 6, 0x085a, { 600, 800, 1000, 1200, 1400, 1600, 1800, 2000}, 'ConfluxMask[Uleguerand]',
        17814074, 253, 7, 0x085a, { 600, 800, 1000, 1200, 1400, 1600, 1800, 2000}, 'ConfluxMask[Uleguerand]',
        17818199, 254, 0, 0x0854, { 600, 800, 1000, 1200, 1400, 1600, 1800, 2000}, 'ConfluxMask[Grauberg]',
        17818200, 254, 1, 0x0855, { 600, 800, 1000, 1200, 1400, 1600, 1800, 2000}, 'ConfluxMask[Grauberg]',
        17818201, 254, 2, 0x0856, { 600, 800, 1000, 1200, 1400, 1600, 1800, 2000}, 'ConfluxMask[Grauberg]',
        17818202, 254, 3, 0x0857, { 600, 800, 1000, 1200, 1400, 1600, 1800, 2000}, 'ConfluxMask[Grauberg]',
        17818203, 254, 4, 0x0858, { 600, 800, 1000, 1200, 1400, 1600, 1800, 2000}, 'ConfluxMask[Grauberg]',
        17818204, 254, 5, 0x0859, { 600, 800, 1000, 1200, 1400, 1600, 1800, 2000}, 'ConfluxMask[Grauberg]',
        17818205, 254, 6, 0x085a, { 600, 800, 1000, 1200, 1400, 1600, 1800, 2000}, 'ConfluxMask[Grauberg]',
        17818206, 254, 7, 0x085b, { 600, 800, 1000, 1200, 1400, 1600, 1800, 2000}, 'ConfluxMask[Grauberg]'
    }

function startConflux(player,npc)

    local npcid = npc:getID();
    local discount = getCruorDiscount(player);
    local cruor = player:getCurrency("cruor");
    local bit = 0;
    local csid = 0x0000;
    local c01 = 0;
    local c02 = 0;
    local c03 = 0;
    local c04 = 0;
    local c05 = 0;
    local c06 = 0;
    local c07 = 0;
    local c08 = 0;
    local maskVar = '';
    local mask = 0;
    local activated = false;

    for i = 1, table.getn(ConfluxData) - 5, 6 do
        if (npcid == ConfluxData[i]) then
            bit = ConfluxData[i + 2];
            csid = ConfluxData[i + 3];
            if (FREE_CONFLUX) then
                c01, c02, c03, c04, c05, c06, c07, c08 = 0, 0, 0, 0, 0, 0, 0, 0, 0;
            else
                c01 = ConfluxData[i + 4][1] * discount;
                c02 = ConfluxData[i + 4][2] * discount;
                c03 = ConfluxData[i + 4][3] * discount;
                c04 = ConfluxData[i + 4][4] * discount;
                c05 = ConfluxData[i + 4][5] * discount;
                c06 = ConfluxData[i + 4][6] * discount;
                c07 = ConfluxData[i + 4][7] * discount;
                c08 = ConfluxData[i + 4][8] * discount;
            end
            maskVar = ConfluxData[i + 5];
            break
        end
    end
    mask = player:getVar(maskVar);
    if ((maskVar == "ConfluxMask[Attohwa]" or maskVar == "ConfluxMask[Misareaux]" or maskVar == "ConfluxMask[Vunkerl]") and player:getMaskBit(mask,8) == false) then
        player:setMaskBit(mask,maskVar,8,true);
    end
    activated = player:getMaskBit(mask,bit);
    if (activated) then
        return csid, c01 + c02 * 65536, c03 + c04 * 65536, c05 + c06 * 65536, c07 + c08 * 65536, mask - 2 ^ bit, 9, 1, cruor;
    elseif (npcid == 17658486 or npcid == 17662691 or npcid == 17666711) then
        mask = mask + 256
        player:setVar(maskVar,mask);
        return csid, c01 + c02 * 65536, c03 + c04 * 65536, c05 + c06 * 65536, c07 + c08 * 65536, mask - 2 ^ bit, 9, 1, cruor;
    else
        return csid, (50 + 100 * 65536) * discount, (150 + 200 * 65536) * discount, (250 + 300 * 65536) * discount, (350 + 400 * 65536) * discount, 0, bit, 2, cruor;
    end
end;

function finishConflux(player,csid,option)
    local npcid = 0
    local zoneid = player:getZone();
    local discount = getCruorDiscount(player);
    local cruor = player:getCurrency("cruor");
    local bit = 0;
    local c01 = 0;
    local c02 = 0;
    local c03 = 0;
    local c04 = 0;
    local c05 = 0;
    local c06 = 0;
    local c07 = 0;
    local c08 = 0;
    local maskVar = '';
    local mask = 0;
    local activated = false;

    for i = 1, table.getn(ConfluxData) - 5, 6 do
        if (zoneid == ConfluxData[i + 1] and csid == ConfluxData[i + 3]) then
            bit = ConfluxData[i + 2];
            if (FREE_CONFLUX) then
                c01, c02, c03, c04, c05, c06, c07, c08 = 0, 0, 0, 0, 0, 0, 0, 0, 0;
            else
                c01 = ConfluxData[i + 4][1] * discount;
                c02 = ConfluxData[i + 4][2] * discount;
                c03 = ConfluxData[i + 4][3] * discount;
                c04 = ConfluxData[i + 4][4] * discount;
                c05 = ConfluxData[i + 4][5] * discount;
                c06 = ConfluxData[i + 4][6] * discount;
                c07 = ConfluxData[i + 4][7] * discount;
                c08 = ConfluxData[i + 4][8] * discount;
            end
            maskVar = ConfluxData[i + 5];
            break
        end
    end

    mask = player:getVar(maskVar);
    activated = player:getMaskBit(mask,bit);

    if (activated) then
        switch (option) : caseof
        {
            [1] = function (x) player:delCurrency("cruor",c01); end,
            [2] = function (x) player:delCurrency("cruor",c02); end,
            [3] = function (x) player:delCurrency("cruor",c03); end,
            [4] = function (x) player:delCurrency("cruor",c04); end,
            [5] = function (x) player:delCurrency("cruor",c05); end,
            [6] = function (x) player:delCurrency("cruor",c06); end,
            [7] = function (x) player:delCurrency("cruor",c07); end,
            [8] = function (x) player:delCurrency("cruor",c08); end,
        }
    else
        if (option == 1) then
            player:setMaskBit(mask,maskVar,bit,true);
            if (FREE_CONFLUX == false and bit ~= 8) then
                player:delCurrency("cruor", (50 * (bit + 1) * discount));
            end
        end
    end

end;

function getCruorDiscount(player)
    local discount = 1

    if (player:hasKeyItem(IVORY_ABYSSITE_OF_CONFLUENCE)) then
        discount = discount - 0.2
    end

    if (player:hasKeyItem(CRIMSON_ABYSSITE_OF_CONFLUENCE)) then
        discount = discount - 0.2
    end

    if (player:hasKeyItem(INDIGO_ABYSSITE_OF_CONFLUENCE)) then
        discount = discount - 0.2
    end

    return discount
end;