require('scripts/globals/keyitems')
require('scripts/globals/quests')
require('scripts/globals/status')
require('scripts/globals/weaponskillids')

dsp = dsp or {}
dsp.wsquest =
{
    --------------------------------------
    -- Quest: The Walls of Your Mind
    --   NPC: Oggbi (Port Bastok)
    --    WS: Asuran Fists (Hand-to-Hand)
    --------------------------------------
    ['asuran_fists'] =
    {
        ['wsId'] = dsp.weaponskill.ASURAN_FISTS,
        ['wsUnlockId'] = dsp.ws_unlock.ASURAN_FISTS,
        ['skillId'] = dsp.skill.HAND_TO_HAND,
        ['minSkill'] = 250,
        ['trialWeaponId'] = 17507,
        ['logId'] = BASTOK,
        ['questId'] = THE_WALLS_OF_YOUR_MIND,
        ['fameRegion'] = BASTOK,
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
    ['evisceration'] =
    {
        ['wsId'] = dsp.weaponskill.EVISCERATION,
        ['wsUnlockId'] = dsp.ws_unlock.EVISCERATION,
        ['skillId'] = dsp.skill.DAGGER,
        ['minSkill'] = 230,
        ['trialWeaponId'] = 17616,
        ['logId'] = OUTLANDS,
        ['questId'] = CLOAK_AND_DAGGER,
        ['fameRegion'] = KAZHAM,
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
    ['savage_blade'] =
    {
        ['wsId'] = dsp.weaponskill.SAVAGE_BLADE,
        ['wsUnlockId'] = dsp.ws_unlock.SAVAGE_BLADE,
        ['skillId'] = dsp.skill.SWORD,
        ['minSkill'] = 240,
        ['trialWeaponId'] = 17654,
        ['logId'] = SANDORIA,
        ['questId'] = OLD_WOUNDS,
        ['fameRegion'] = SANDORIA,
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
    ['ground_strike'] =
    {
        ['wsId'] = dsp.weaponskill.GROUND_STRIKE,
        ['wsUnlockId'] = dsp.ws_unlock.GROUND_STRIKE,
        ['skillId'] = dsp.skill.GREAT_SWORD,
        ['minSkill'] = 250,
        ['trialWeaponId'] = 16952,
        ['logId'] = BASTOK,
        ['questId'] = INHERITANCE,
        ['fameRegion'] = BASTOK,
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
    ['decimation'] =
    {
        ['wsId'] = dsp.weaponskill.DECIMATION,
        ['wsUnlockId'] = dsp.ws_unlock.DECIMATION,
        ['skillId'] = dsp.skill.AXE,
        ['minSkill'] = 240,
        ['trialWeaponId'] = 17933,
        ['logId'] = JEUNO,
        ['questId'] = AXE_THE_COMPETITION,
        ['fameRegion'] = JEUNO,
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
    ['steel_cyclone'] =
    {
        ['wsId'] = dsp.weaponskill.STEEL_CYCLONE,
        ['wsUnlockId'] = dsp.ws_unlock.STEEL_CYCLONE,
        ['skillId'] = dsp.skill.GREAT_AXE,
        ['minSkill'] = 240,
        ['trialWeaponId'] = 16735,
        ['logId'] = BASTOK,
        ['questId'] = THE_WEIGHT_OF_YOUR_LIMITS,
        ['fameRegion'] = BASTOK,
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
    ['spiral_hell'] =
    {
        ['wsId'] = dsp.weaponskill.SPIRAL_HELL,
        ['wsUnlockId'] = dsp.ws_unlock.SPIRAL_HELL,
        ['skillId'] = dsp.skill.SCYTHE,
        ['minSkill'] = 240,
        ['trialWeaponId'] = 16793,
        ['logId'] = SANDORIA,
        ['questId'] = SOULS_IN_SHADOW,
        ['fameRegion'] = SANDORIA,
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
    ['impulse_drive'] =
    {
        ['wsId'] = dsp.weaponskill.IMPULSE_DRIVE,
        ['wsUnlockId'] = dsp.ws_unlock.IMPULSE_DRIVE,
        ['skillId'] = dsp.skill.POLEARM,
        ['minSkill'] = 240,
        ['trialWeaponId'] = 16892,
        ['logId'] = SANDORIA,
        ['questId'] = METHODS_CREATE_MADNESS,
        ['fameRegion'] = SANDORIA,
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
    ['blade_ku'] =
    {
        ['wsId'] = dsp.weaponskill.BLADE_KU,
        ['wsUnlockId'] = dsp.ws_unlock.BLADE_KU,
        ['skillId'] = dsp.skill.KATANA,
        ['minSkill'] = 250,
        ['trialWeaponId'] = 17773,
        ['logId'] = OUTLANDS,
        ['questId'] = BUGI_SODEN,
        ['fameRegion'] = NORG,
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
    ['tachi_kasha'] =
    {
        ['wsId'] = dsp.weaponskill.TACHI_KASHA,
        ['wsUnlockId'] = dsp.ws_unlock.TACHI_KASHA,
        ['skillId'] = dsp.skill.GREAT_KATANA,
        ['minSkill'] = 250,
        ['trialWeaponId'] = 17815,
        ['logId'] = OUTLANDS,
        ['questId'] = THE_POTENTIAL_WITHIN,
        ['fameRegion'] = NORG,
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
    ['black_halo'] =
    {
        ['wsId'] = dsp.weaponskill.BLACK_HALO,
        ['wsUnlockId'] = dsp.ws_unlock.BLACK_HALO,
        ['skillId'] = dsp.skill.CLUB,
        ['minSkill'] = 230,
        ['trialWeaponId'] = 17456,
        ['logId'] = WINDURST,
        ['questId'] = ORASTERY_WOES,
        ['fameRegion'] = WINDURST,
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
    ['retribution'] =
    {
        ['wsId'] = dsp.weaponskill.RETRIBUTION,
        ['wsUnlockId'] = dsp.ws_unlock.RETRIBUTION,
        ['skillId'] = dsp.skill.STAFF,
        ['minSkill'] = 230,
        ['trialWeaponId'] = 17527,
        ['logId'] = WINDURST,
        ['questId'] = BLOOD_AND_GLORY,
        ['fameRegion'] = WINDURST,
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
    --    WS: Empyreal Arrow (Archery)
    ----------------------------------------
    ['empyreal_arrow'] =
    {
        ['wsId'] = dsp.weaponskill.EMPYREAL_ARROW,
        ['wsUnlockId'] = dsp.ws_unlock.EMPYREAL_ARROW,
        ['skillId'] = dsp.skill.ARCHERY,
        ['minSkill'] = 250,
        ['trialWeaponId'] = 18144,
        ['logId'] = WINDURST,
        ['questId'] = FROM_SAPLINGS_GROW,
        ['fameRegion'] = WINDURST,
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
    ['detonator'] =
    {
        ['wsId'] = dsp.weaponskill.DETONATOR,
        ['wsUnlockId'] = dsp.ws_unlock.DETONATOR,
        ['skillId'] = dsp.skill.MARKSMANSHIP,
        ['minSkill'] = 250,
        ['trialWeaponId'] = 18146,
        ['logId'] = BASTOK,
        ['questId'] = SHOOT_FIRST_ASK_QUESTIONS_LATER,
        ['fameRegion'] = BASTOK,
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
}

local WSQUEST_START = 0 -- Quest is available or completed
local WSQUEST_CONT1 = 1 -- Player has accepted quest ('cont1')
local WSQUEST_CONT2 = 2 -- Player has turned in completed trial weapon and received Map to Annals ('cont2')
local WSQUEST_FINISH = 3 -- Player has killed NM and received Annals of Truth ('finish')

local function getQuestState(quest,player)
    local status = player:getQuestStatus(quest.logId,quest.questId)
    if status == QUEST_ACCEPTED then
        if player:hasKeyItem(dsp.ki.ANNALS_OF_TRUTH) then
            return WSQUEST_FINISH
        elseif player:hasKeyItem(dsp.ki.MAP_TO_THE_ANNALS_OF_TRUTH) then
            return WSQUEST_CONT2
        else
            return WSQUEST_CONT1
        end
    elseif status == QUEST_AVAILABLE then
        local canEquip = player:canEquipItem(quest.trialWeaponId,true)
        local sufficientSkill = player:getCharSkillLevel(quest.skillId) / 10 >= quest.minSkill
        local hasWeapon = player:hasItem(quest.trialWeaponId)
        local hasTrainingGuide = player:hasKeyItem(dsp.ki.WEAPON_TRAINING_GUIDE)

        if canEquip and sufficientSkill and not hasWeapon and not hasTrainingGuide then
            return WSQUEST_START
        end
    end

    return nil
end

dsp.wsquest.getTradeEvent = function(quest,player,trade)
    local wsPoints = (trade:getItem(0):getWeaponskillPoints())
    if getQuestState(quest,player) == WSQUEST_CONT1 and trade:hasItemQty(quest.trialWeaponId,1) and trade:getItemCount() == 1 then
        if wsPoints < 300 then
            return quest.eventIds.tradedUnfinishedWeapon
        else
            return quest.eventIds.tradedFinishedWeapon
        end
    end

    return nil
end

dsp.wsquest.getTriggerEvent = function(quest,player)
    local state = getQuestState(quest,player)

    if state == WSQUEST_START then
        return quest.eventIds.start -- WS Quest start
    elseif state == WSQUEST_CONT1 then
        return quest.eventIds.cont1
    elseif state == WSQUEST_CONT2 then
        return quest.eventIds.cont2
    elseif state == WSQUEST_FINISH then
        return quest.eventIds.finish -- WS Quest completed (WSNM killed)
    end

    return nil
end

dsp.wsquest.handleQmTrigger = function(quest, player, wsnmId)
    local ID = zones[player:getZoneID()]
    if getQuestState(quest, player) == WSQUEST_CONT2 then
        if player:getLocalVar('killed_wsnm') == 1 then
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.ANNALS_OF_TRUTH)
            player:addKeyItem(dsp.ki.ANNALS_OF_TRUTH)
        elseif not GetMobByID(wsnmId):isSpawned() then
            player:messageSpecial(ID.text.SENSE_OMINOUS_PRESENCE)
            SpawnMob(wsnmId):updateClaim(player)
        end
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end
end

dsp.wsquest.handleWsnmDeath = function(quest, player)
    if getQuestState(quest, player) == WSQUEST_CONT2 then
        player:setLocalVar('killed_wsnm', 1)
    end
end

dsp.wsquest.handleEventFinish = function(quest,player,csid,option,learnedId)
    if csid == quest.eventIds.start then -- WS Quest start
        if quest.options.acceptStart == nil or option == quest.options.acceptStart then
            if player:getFreeSlotsCount() < 1 then
                player:messageSpecial(zones[player:getZoneID()].text.ITEM_CANNOT_BE_OBTAINED,quest.trialWeaponId)
            else
                player:messageSpecial(zones[player:getZoneID()].text.ITEM_OBTAINED,quest.trialWeaponId)
                player:messageSpecial(zones[player:getZoneID()].text.KEYITEM_OBTAINED,dsp.ki.WEAPON_TRAINING_GUIDE)
                player:addItem(quest.trialWeaponId)
                player:addKeyItem(dsp.ki.WEAPON_TRAINING_GUIDE)
                player:addQuest(quest.logId,quest.questId)
            end
        end
    elseif csid == quest.eventIds.cont1 then -- WS Quest ongoing stage 1
        if quest.options.dropped ~= nil and option == quest.options.dropped then -- Misplaced weapon
            if player:hasItem(quest.trialWeaponId) then
                player:messageSpecial(zones[player:getZoneID()].text.ITEM_CANNOT_BE_OBTAINED,quest.trialWeaponId)
            else
                player:messageSpecial(zones[player:getZoneID()].text.ITEM_OBTAINED,quest.trialWeaponId)
                player:addItem(quest.trialWeaponId)
            end
        end
        if option == quest.options.abandon then -- Abandon quest
            player:delQuest(quest.logId,quest.questId)
            player:delKeyItem(dsp.ki.WEAPON_TRAINING_GUIDE)
            player:delKeyItem(dsp.ki.MAP_TO_THE_ANNALS_OF_TRUTH)
        end
    elseif csid == quest.eventIds.tradedFinishedWeapon then -- WS Quest ongoing stage 2
        player:tradeComplete()
        player:messageSpecial(zones[player:getZoneID()].text.KEYITEM_OBTAINED,dsp.ki.MAP_TO_THE_ANNALS_OF_TRUTH)
        player:addKeyItem(dsp.ki.MAP_TO_THE_ANNALS_OF_TRUTH)
    elseif csid == quest.eventIds.finish then -- WS Quest completed
        player:messageSpecial(learnedId)
        player:addLearnedWeaponskill(quest.wsUnlockId)
        player:addFame(quest.fameRegion,30)
        player:delKeyItem(dsp.ki.MAP_TO_THE_ANNALS_OF_TRUTH)
        player:delKeyItem(dsp.ki.ANNALS_OF_TRUTH)
        player:delKeyItem(dsp.ki.WEAPON_TRAINING_GUIDE)
        player:completeQuest(quest.logId,quest.questId)
    end
end
