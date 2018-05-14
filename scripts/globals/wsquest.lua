require('scripts/globals/keyitems');
require('scripts/globals/quests');
require('scripts/globals/status');

dsp = dsp or {};
dsp.wsquest =
{
    --------------------------------------
    -- Quest: The Walls of Your Mind
    --   NPC: Oggbi (Port Bastok)
    --    WS: Asuran Fists (Hand-to-Hand)
    --------------------------------------
    ['theWallsOfYourMind'] =
    {
        ['questName'] = 'The Walls Of Your Mind',
        ['wsName'] = 'Asuran Fists',
        ['wsId'] = 9,
        ['wsUnlockId'] = 1,
        ['skillId'] = dsp.skill.HAND_TO_HAND,
        ['minSkill'] = 250,
        ['trialWeaponName'] = 'Knuckles of Trials',
        ['trialWeaponId'] = 17507,
        ['logId'] = BASTOK,
        ['questId'] = THE_WALLS_OF_YOUR_MIND,
        ['fameRegion'] = BASTOK,
        ['wsnmName'] = 'Bodach',
        ['wsnmId'] = 17461479,
        ['eventIds'] =
        {
            ['start'] = 286,
            ['cont1'] = 287,
            ['cont2'] = nil,
            ['tradedUnfinishedWeapon'] = 288,
            ['tradedFinishedWeapon'] = 289,
            ['finish'] = 290
        },
        ['options'] =
        {
            ['acceptStart'] = nil,
            ['dropped'] = 1,
            ['abandon'] = 2
        }
    },
    ------------------------------------
    -- Quest: Cloak and Dagger
    --   NPC: Jakoh Wahcondalo (Kazham)
    --    WS: Evisceration (Dagger)
    ------------------------------------
    ['cloakAndDagger'] =
    {
        ['questName'] = 'Cloak and Dagger',
        ['wsName'] = 'Evisceration',
        ['wsId'] = 25,
        ['wsUnlockId'] = 2,
        ['skillId'] = dsp.skill.DAGGER,
        ['minSkill'] = 230,
        ['trialWeaponName'] = 'Dagger of Trials',
        ['trialWeaponId'] = 17616,
        ['logId'] = OUTLANDS,
        ['questId'] = CLOAK_AND_DAGGER,
        ['fameRegion'] = KAZHAM,
        ['wsnmName'] = 'Baronial Bat',
        ['wsnmId'] = 17645809,
        ['eventIds'] =
        {
            ['start'] = 279,
            ['cont1'] = 280,
            ['cont2'] = 283,
            ['tradedUnfinishedWeapon'] = 281,
            ['tradedFinishedWeapon'] = 282,
            ['finish'] = 284
        },
        ['options'] =
        {
            ['acceptStart'] = nil,
            ['dropped'] = 1,
            ['abandon'] = 3
        }
    },
    ----------------------------------------
    -- Quest: Old Wounds
    --   NPC: Curilla (Chateau d'Oraguille)
    --    WS: Savage Blade (Sword)
    ----------------------------------------
    ['oldWounds'] =
    {
        ['questName'] = 'Old Wounds',
        ['wsName'] = 'Savage Blade',
        ['wsId'] = 42,
        ['wsUnlockId'] = 3,
        ['skillId'] = dsp.skill.SWORD,
        ['minSkill'] = 240,
        ['trialWeaponName'] = 'Sapara of Trials',
        ['trialWeaponId'] = 17654,
        ['logId'] = SANDORIA,
        ['questId'] = OLD_WOUNDS,
        ['fameRegion'] = SANDORIA,
        ['wsnmName'] = 'Girtablulu',
        ['wsnmId'] = 17629645,
        ['eventIds'] =
        {
            ['start'] = 43,
            ['cont1'] = 46,
            ['cont2'] = 47,
            ['tradedUnfinishedWeapon'] = 45,
            ['tradedFinishedWeapon'] = 44,
            ['finish'] = 48
        },
        ['options'] =
        {
            ['acceptStart'] = 1,
            ['dropped'] = 1,
            ['abandon'] = 2
        }
    },
    --------------------------------------
    -- Quest: Inheritance
    --   NPC: Gumbah (Bastok Mines)
    --    WS: Ground Strike (Great Sword)
    --------------------------------------
    ['inheritance'] =
    {
        ['questName'] = 'Inheritance',
        ['wsName'] = 'Ground Strike',
        ['wsId'] = 56,
        ['wsUnlockId'] = 4,
        ['skillId'] = dsp.skill.GREAT_SWORD,
        ['minSkill'] = 250,
        ['trialWeaponName'] = 'Sword of Trials',
        ['trialWeaponId'] = 16952,
        ['logId'] = BASTOK,
        ['questId'] = INHERITANCE,
        ['fameRegion'] = BASTOK,
        ['wsnmName'] = 'Maharaja',
        ['wsnmId'] = 17289656,
        ['eventIds'] =
        {
            ['start'] = 190,
            ['cont1'] = 191,
            ['cont2'] = nil,
            ['tradedUnfinishedWeapon'] = 192,
            ['tradedFinishedWeapon'] = 193,
            ['finish'] = 194
        },
        ['options'] =
        {
            ['acceptStart'] = nil,
            ['dropped'] = 1,
            ['abandon'] = 2
        }
    },
    -------------------------------
    -- Quest: Axe The Competition
    --   NPC: Brutus (Upper Jeuno)
    --    WS: Decimation (Axe)
    -------------------------------
    ['axeTheCompetition'] =
    {
        ['questName'] = 'Axe The Competition',
        ['wsName'] = 'Decimation',
        ['wsId'] = 72,
        ['wsUnlockId'] = 5,
        ['skillId'] = dsp.skill.AXE,
        ['minSkill'] = 240,
        ['trialWeaponName'] = 'Pick of Trials',
        ['trialWeaponId'] = 17933,
        ['logId'] = JEUNO,
        ['questId'] = AXE_THE_COMPETITION,
        ['fameRegion'] = JEUNO,
        ['wsnmName'] = 'Yallery Brown',
        ['wsnmId'] = 17428817,
        ['eventIds'] =
        {
            ['start'] = 12,
            ['cont1'] = 15,
            ['cont2'] = 16,
            ['tradedUnfinishedWeapon'] = 14,
            ['tradedFinishedWeapon'] = 13,
            ['finish'] = 17
        },
        ['options'] =
        {
            ['acceptStart'] = 1,
            ['dropped'] = 1,
            ['abandon'] = 2
        }
    },
    ------------------------------------
    -- Quest: The Weight Of Your Limits
    --   NPC: Iron Eater (Metalworks)
    --    WS: Steel Cyclone (Great Axe)
    ------------------------------------
    ['theWeightOfYourLimits'] =
    {
        ['questName'] = 'The Weight Of Your Limits',
        ['wsName'] = 'Steel Cyclone',
        ['wsId'] = 88,
        ['wsUnlockId'] = 6,
        ['skillId'] = dsp.skill.GREAT_AXE,
        ['minSkill'] = 240,
        ['trialWeaponName'] = 'Axe of Trials',
        ['trialWeaponId'] = 16735,
        ['logId'] = BASTOK,
        ['questId'] = THE_WEIGHT_OF_YOUR_LIMITS,
        ['fameRegion'] = BASTOK,
        ['wsnmName'] = 'Greenman',
        ['wsnmId'] = 17273295,
        ['eventIds'] =
        {
            ['start'] = 790,
            ['cont1'] = 791,
            ['cont2'] = nil,
            ['tradedUnfinishedWeapon'] = 792,
            ['tradedFinishedWeapon'] = 793,
            ['finish'] = 794
        },
        ['options'] =
        {
            ['acceptStart'] = nil,
            ['dropped'] = 1,
            ['abandon'] = 2
        }
    },
    ---------------------------------------------
    -- Quest: Souls In Shadow
    --   NPC: Novalmauge (Bostaunieux Oubliette)
    --    WS: Spiral Hell (Scythe)
    ---------------------------------------------
    ['soulsInShadow'] =
    {
        ['questName'] = 'Souls In Shadow',
        ['wsName'] = 'Spiral Hell',
        ['wsId'] = 104,
        ['wsUnlockId'] = 7,
        ['skillId'] = dsp.skill.SCYTHE,
        ['minSkill'] = 240,
        ['trialWeaponName'] = 'Scythe of Trials',
        ['trialWeaponId'] = 16793,
        ['logId'] = SANDORIA,
        ['questId'] = SOULS_IN_SHADOW,
        ['fameRegion'] = SANDORIA,
        ['wsnmName'] = 'Mokumokuren',
        ['wsnmId'] = 17433006,
        ['eventIds'] =
        {
            ['start'] = 0,
            ['cont1'] = 3,
            ['cont2'] = 4,
            ['tradedUnfinishedWeapon'] = 2,
            ['tradedFinishedWeapon'] = 1,
            ['finish'] = 5
        },
        ['options'] =
        {
            ['acceptStart'] = 1,
            ['dropped'] = 1,
            ['abandon'] = 2
        }
    },
    -----------------------------------------
    -- Quest: Methods Create Madness
    --   NPC: Balasiel (Southern San d'Oria)
    --    WS: Impulse Drive (Polearm)
    -----------------------------------------
    ['methodsCreateMadness'] =
    {
        ['questName'] = 'Methods Create Madness',
        ['wsName'] = 'Impulse Drive',
        ['wsId'] = 120,
        ['wsUnlockId'] = 8,
        ['skillId'] = dsp.skill.POLEARM,
        ['minSkill'] = 240,
        ['trialWeaponName'] = 'Spear of Trials',
        ['trialWeaponId'] = 16892,
        ['logId'] = SANDORIA,
        ['questId'] = METHODS_CREATE_MADNESS,
        ['fameRegion'] = SANDORIA,
        ['wsnmName'] = 'Water Leaper',
        ['wsnmId'] = 17498565,
        ['eventIds'] =
        {
            ['start'] = 8,
            ['cont1'] = 11,
            ['cont2'] = 12,
            ['tradedUnfinishedWeapon'] = 10,
            ['tradedFinishedWeapon'] = 9,
            ['finish'] = 13
        },
        ['options'] =
        {
            ['acceptStart'] = 1,
            ['dropped'] = 1,
            ['abandon'] = 2
        }
    },
    -----------------------------
    -- Quest: Bugi Soden
    --   NPC: Ryoma (Norg)
    --    WS: Blade: Ku (Katana)
    -----------------------------
    ['bugiSoden'] =
    {
        ['questName'] = 'Bugi Soden',
        ['wsName'] = 'Blade: Ku',
        ['wsId'] = 136,
        ['wsUnlockId'] = 9,
        ['skillId'] = dsp.skill.KATANA,
        ['minSkill'] = 250,
        ['trialWeaponName'] = 'Kodachi of Trials',
        ['trialWeaponId'] = 17773,
        ['logId'] = OUTLANDS,
        ['questId'] = BUGI_SODEN,
        ['fameRegion'] = NORG,
        ['wsnmName'] = 'Megapod Megalops',
        ['wsnmId'] = 17649861,
        ['eventIds'] =
        {
            ['start'] = 184,
            ['cont1'] = 185,
            ['cont2'] = 188,
            ['tradedUnfinishedWeapon'] = 186,
            ['tradedFinishedWeapon'] = 187,
            ['finish'] = 189
        },
        ['options'] =
        {
            ['acceptStart'] = 1,
            ['dropped'] = nil,
            ['abandon'] = 2
        }
    },
    --------------------------------------
    -- Quest: The Potential Within
    --   NPC: Jaucribaix (Norg)
    --    WS: Tachi: Kasha (Great Katana)
    --------------------------------------
    ['thePotentialWithin'] =
    {
        ['questName'] = 'The Potential Within',
        ['wsName'] = 'Tachi: Kasha',
        ['wsId'] = 152,
        ['wsUnlockId'] = 10,
        ['skillId'] = dsp.skill.GREAT_KATANA,
        ['minSkill'] = 250,
        ['trialWeaponName'] = 'Tachi of Trials',
        ['trialWeaponId'] = 17815,
        ['logId'] = OUTLANDS,
        ['questId'] = THE_POTENTIAL_WITHIN,
        ['fameRegion'] = NORG,
        ['wsnmName'] = 'Kettenkaefer',
        ['wsnmId'] = 17490235,
        ['eventIds'] =
        {
            ['start'] = 178,
            ['cont1'] = 179,
            ['cont2'] = 182,
            ['tradedUnfinishedWeapon'] = 180,
            ['tradedFinishedWeapon'] = 181,
            ['finish'] = 183
        },
        ['options'] =
        {
            ['acceptStart'] = 1,
            ['dropped'] = nil,
            ['abandon'] = 2
        }
    },
    ----------------------------------------
    -- Quest: Orastery Woes
    --   NPC: Kuroido-Moido (Port Windurst)
    --    WS: Black Halo (Club)
    ----------------------------------------
    ['orasteryWoes'] =
    {
        ['questName'] = 'Orastery Woes',
        ['wsName'] = 'Black Halo',
        ['wsId'] = 169,
        ['wsUnlockId'] = 11,
        ['skillId'] = dsp.skill.CLUB,
        ['minSkill'] = 230,
        ['trialWeaponName'] = 'Club of Trials',
        ['trialWeaponId'] = 17456,
        ['logId'] = WINDURST,
        ['questId'] = ORASTERY_WOES,
        ['fameRegion'] = WINDURST,
        ['wsnmName'] = 'Eldhrimnir',
        ['wsnmId'] = 17277126,
        ['eventIds'] =
        {
            ['start'] = 578,
            ['cont1'] = 579,
            ['cont2'] = 582,
            ['tradedUnfinishedWeapon'] = 580,
            ['tradedFinishedWeapon'] = 581,
            ['finish'] = 583
        },
        ['options'] =
        {
            ['acceptStart'] = nil,
            ['dropped'] = 1,
            ['abandon'] = 3
        }
    },
    -------------------------------------
    -- Quest: Blood And Glory
    --   NPC: Shantotto (Windurst Walls)
    --    WS: Retribution (Staff)
    -------------------------------------
    ['bloodAndGlory'] =
    {
        ['questName'] = 'Blood And Glory',
        ['wsName'] = 'Retribution',
        ['wsId'] = 184,
        ['wsUnlockId'] = 12,
        ['skillId'] = dsp.skill.STAFF,
        ['minSkill'] = 230,
        ['trialWeaponName'] = 'Pole of Trials',
        ['trialWeaponId'] = 17527,
        ['logId'] = WINDURST,
        ['questId'] = BLOOD_AND_GLORY,
        ['fameRegion'] = WINDURST,
        ['wsnmName'] = 'Cailleach Bheur',
        ['wsnmId'] = 17617165,
        ['eventIds'] =
        {
            ['start'] = 445,
            ['cont1'] = 446,
            ['cont2'] = 449,
            ['tradedUnfinishedWeapon'] = 447,
            ['tradedFinishedWeapon'] = 448,
            ['finish'] = 450
        },
        ['options'] =
        {
            ['acceptStart'] = nil,
            ['dropped'] = 1,
            ['abandon'] = 3
        }
    },
    ----------------------------------------
    -- Quest: From Saplings Grow
    --   NPC: Perih Vashai (Windurst Woods)
    --    WS: Empyrean Arrow (Archery)
    ----------------------------------------
    ['fromSaplingsGrow'] =
    {
        ['questName'] = 'From Saplings Grow',
        ['wsName'] = 'Empyrean Arrow',
        ['wsId'] = 199,
        ['wsUnlockId'] = 13,
        ['skillId'] = dsp.skill.ARCHERY,
        ['minSkill'] = 250,
        ['trialWeaponName'] = 'Bow of Trials',
        ['trialWeaponId'] = 18144,
        ['logId'] = WINDURST,
        ['questId'] = FROM_SAPLINGS_GROW,
        ['fameRegion'] = WINDURST,
        ['wsnmName'] = 'Stolas',
        ['wsnmId'] = 17240424,
        ['eventIds'] =
        {
            ['start'] = 661,
            ['cont1'] = 662,
            ['cont2'] = 665,
            ['tradedUnfinishedWeapon'] = 663,
            ['tradedFinishedWeapon'] = 664,
            ['finish'] = 666
        },
        ['options'] =
        {
            ['acceptStart'] = nil,
            ['dropped'] = 1,
            ['abandon'] = 3
        }
    },
    -------------------------------------------
    -- Quest: Shoot First, Ask Questions Later
    --   NPC: Cid (Metalworks)
    --    WS: Detonator (Marksmanship)
    -------------------------------------------
    ['shootFirstAskQuestionsLater'] =
    {
        ['questName'] = 'Shoot First, Ask Questions Later',
        ['wsName'] = 'Detonator',
        ['wsId'] = 215,
        ['wsUnlockId'] = 14,
        ['skillId'] = dsp.skill.MARKSMANSHIP,
        ['minSkill'] = 250,
        ['trialWeaponName'] = 'Gun of Trials',
        ['trialWeaponId'] = 18146,
        ['logId'] = BASTOK,
        ['questId'] = SHOOT_FIRST_ASK_QUESTIONS_LATER,
        ['fameRegion'] = BASTOK,
        ['wsnmName'] = 'Beet Leafhopper',
        ['wsnmId'] = 17404338,
        ['eventIds'] =
        {
            ['start'] = 795,
            ['cont1'] = 796,
            ['cont2'] = nil,
            ['tradedUnfinishedWeapon'] = 797,
            ['tradedFinishedWeapon'] = 798,
            ['finish'] = 799
        },
        ['options'] =
        {
            ['acceptStart'] = nil,
            ['dropped'] = 1,
            ['abandon'] = 2
        }
    },
};

local WSQUEST_START = 0; -- Quest is available or completed
local WSQUEST_CONT1 = 1; -- Player has accepted quest ('cont1')
local WSQUEST_CONT2 = 2; -- Player has turned in completed trial weapon and received Map to Annals ('cont2')
local WSQUEST_FINISH = 3; -- Player has killed NM and received Annals of Truth ('finish')

local function getWsQuestState(quest, player)
    if (player:getQuestStatus(quest.logId, quest.questId) == QUEST_ACCEPTED) then
        if (player:hasKeyItem(dsp.ki.ANNALS_OF_TRUTH)) then
            return WSQUEST_FINISH;
        elseif (player:hasKeyItem(dsp.ki.MAP_TO_THE_ANNALS_OF_TRUTH)) then
            return WSQUEST_CONT2;
        else
            return WSQUEST_CONT1;
        end;
    else
        local canEquip = player:canEquipItem(quest.trialWeaponId, true);
        local sufficientSkill = player:getSkillLevel(quest.skillId) >= quest.minSkill;
        local hasWeapon = player:hasItem(quest.trialWeaponId);
        local hasTrainingGuide = player:hasKeyItem(dsp.ki.WEAPON_TRAINING_GUIDE);

        if (canEquip and sufficientSkill and not hasWeapon and not hasTrainingGuide) then
            return WSQUEST_START;
        end;
    end;

    return nil;
end;

local function getWsnmVariableName(quest)
    return string.format('Killed_%s', string.gsub(quest.wsnmName, ' ', '_'));
end;

function getWsQuestTradeEvent(quest, player, trade)
    local wsPoints = (trade:getItem(0):getWeaponskillPoints());

    if (getWsQuestState(quest, player) == WSQUEST_CONT1 and trade:hasItemQty(quest.trialWeaponId, 1) and trade:getItemCount() == 1) then
        if (wsPoints < 300) then
            return quest.eventIds.tradedUnfinishedWeapon;
        else
            return quest.eventIds.tradedFinishedWeapon;
        end;
    end;

    return nil;
end;

function getWsQuestTriggerEvent(quest, player)
    local state = getWsQuestState(quest, player);

    if (state == WSQUEST_START) then
        return quest.eventIds.start; -- WS Quest start
    elseif (state == WSQUEST_CONT1) then
        return quest.eventIds.cont1;
    elseif (state == WSQUEST_CONT2) then
        return quest.eventIds.cont2;
    elseif (state == WSQUEST_FINISH) then
        return quest.eventIds.finish; -- WS Quest completed (WSNM killed)
    end;

    return nil;
end;

function handleQmTrigger(quest, player)
    if (getWsQuestState(quest, player) == WSQUEST_CONT2) then
        if (player:getVar(getWsnmVariableName(quest)) == 1) then
            player:messageSpecial(KEYITEM_OBTAINED, dsp.ki.ANNALS_OF_TRUTH);
            player:addKeyItem(dsp.ki.ANNALS_OF_TRUTH);
        elseif (GetMobAction(quest.wsnmId) == 0) then
            player:messageSpecial(SENSE_OMINOUS_PRESENCE);
            SpawnMob(quest.wsnmId):updateClaim(player);
        end;
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end;
end;

function handleWsnmDeath(quest, player)
    if (getWsQuestState(quest, player) == WSQUEST_CONT2) then
        player:setVar(getWsnmVariableName(quest), 1);
    end;
end;

function handleWsQuestEventFinish(quest, player, csid, option, learnedId)
    if (csid == quest.eventIds.start and ((quest.options.acceptStart == nil) or (option == quest.options.acceptStart))) then -- WS Quest start
        if (player:getFreeSlotsCount() < 1) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, quest.trialWeaponId);
        else
            player:messageSpecial(ITEM_OBTAINED, quest.trialWeaponId);
            player:messageSpecial(KEYITEM_OBTAINED, dsp.ki.WEAPON_TRAINING_GUIDE);
            player:addItem(quest.trialWeaponId);
            player:addKeyItem(dsp.ki.WEAPON_TRAINING_GUIDE);
            player:addQuest(quest.logId, quest.questId);
        end;
    elseif (csid == quest.eventIds.cont1) then -- WS Quest ongoing stage 1
        if ((quest.options.dropped ~= nil) and (option == quest.options.dropped)) then -- Misplaced weapon
            if (player:hasItem(quest.trialWeaponId)) then
                player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, quest.trialWeaponId);
            else
                player:messageSpecial(ITEM_OBTAINED, quest.trialWeaponId);
                player:addItem(quest.trialWeaponId);
            end;
        end;
        if (option == quest.options.abandon) then -- Abandon quest
            player:delQuest(quest.logId, quest.questId);
            player:delKeyItem(dsp.ki.WEAPON_TRAINING_GUIDE);
            player:delKeyItem(dsp.ki.MAP_TO_THE_ANNALS_OF_TRUTH);
        end;
    elseif (csid == quest.eventIds.tradedFinishedWeapon) then -- WS Quest ongoing stage 2
        player:tradeComplete();
        player:messageSpecial(KEYITEM_OBTAINED, dsp.ki.MAP_TO_THE_ANNALS_OF_TRUTH);
        player:addKeyItem(dsp.ki.MAP_TO_THE_ANNALS_OF_TRUTH);
    elseif (csid == quest.eventIds.finish) then -- WS Quest completed
        player:messageSpecial(learnedId);
        player:addLearnedWeaponskill(quest.wsUnlockId);
        player:addFame(quest.fameRegion, 30);
        player:delKeyItem(dsp.ki.MAP_TO_THE_ANNALS_OF_TRUTH);
        player:delKeyItem(dsp.ki.ANNALS_OF_TRUTH);
        player:delKeyItem(dsp.ki.WEAPON_TRAINING_GUIDE);
        player:completeQuest(quest.logId, quest.questId);
    end;
end;