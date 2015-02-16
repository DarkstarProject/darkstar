-----------------------------------
-- Area: Provenance
--  HNM: Minerva
-- Provenance Secret Bonus Boss
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/utils");
require("scripts/globals/spoofchat");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_SPECIAL_COOL, 20); -- Time between Melee special uses
    mob:setMobMod(MOBMOD_SPECIAL_SKILL, 1861); -- Melee special MobSkill ID
    mob:setMobMod(MOBMOD_MAGIC_COOL, 28); -- Time between Magic Cast attempts
    mob:setMobMod(MOBMOD_ADD_EFFECT, mob:getShortID());
    mob:setMobMod(MOBMOD_AUTO_SPIKES, mob:getShortID());
end

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(MOD_INT, 20);
    mob:addMod(MOD_MND, 10);
    mob:addMod(MOD_CHR, 24);
    mob:addMod(MOD_MATT, 33);
    mob:addMod(MOD_MACC, 100);
    mob:setMod(MOD_REGEN, 20);
    mob:setMod(MOD_REFRESH, 20);
    mob:setMod(MOD_REGAIN, 20);
    mob:setMod(MOD_UFASTCAST, 80);
    mob:setMod(MOD_CURE_POTENCY, 21);
    mob:setMod(MOD_CURE_POTENCY_RCVD, 28);
    mob:SetMobSkillAttack(true); -- Enable Special Animation for melee attacks.
end;

-----------------------------------
-- onMobEngaged Action
-----------------------------------

function onMobEngaged(mob, target)
    if (target:getParty() ~= nil) then
        local targets = target:getParty(); -- local targets = mob:getEnmityList();
        for hey, dude in pairs(targets) do
            if (dude:isPC()) then
                dude:ChangeMusic(0, 187); -- Background Music (Day time, 7:00 -> 18:00)
                dude:ChangeMusic(1, 187); -- Background Music (Night time, 18:00 -> 7:00)
                dude:ChangeMusic(2, 187); -- SoloBattle Music
                dude:ChangeMusic(3, 187); -- Party Battle Music
            end
        end
    elseif (target:isPC()) then
        target:ChangeMusic(0, 187); -- Background Music (Day time, 7:00 -> 18:00)
        target:ChangeMusic(1, 187); -- Background Music (Night time, 18:00 -> 7:00)
        target:ChangeMusic(2, 187); -- SoloBattle Music
        target:ChangeMusic(3, 187); -- Party Battle Music
    end

    mob:SpoofChatParty("The heart of the crystal..This power can sustain even gods..", MESSAGE_SAY);
    mob:SpoofChatParty("It is a pity, but I must end your world for the good of mine.", MESSAGE_SAY);
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob, target)
    -- local BattelTime = mob:getBattleTime();
    local Minerva_2hr_Used = mob:getLocalVar("Minerva_2hr");
    local Ambrosia = mob:getLocalVar("Minerva_Ambrosia");
    -- target:PrintToPlayer(string.format("2hr lv: %u ", Minerva_2hr_Used));

    -- if (BattleTime - LastElemental > 30) then
        -- pop my elementals again.
    -- end

    if (mob:hasStatusEffect(EFFECT_TABULA_RASA) == true) then
        mob:setSpellList(778); -- Use alternate spell list during Tabula Rasa
        mob:setMobMod(MOBMOD_MAGIC_COOL, 20); -- Reducing time between cast attempts.
        mob:setMod(MOD_UFASTCAST, 95); -- Casting even faster than we already were.
    elseif (mob:hasStatusEffect(EFFECT_TABULA_RASA) == false) then
        mob:setSpellList(777); -- Tabula Rasa wore off, set spell list back to normal.
        mob:setMobMod(MOBMOD_MAGIC_COOL, 28); -- Time between cast attempts back to normal.
        mob:setMod(MOD_UFASTCAST, 80); -- Casting speed back to normal.
    end

    if (mob:getHPP() <= 11) then -- Tabula Rasa and Invincible together!
        if (Minerva_2hr_Used == 4) then
            mob:SpoofChatParty("No! I will not fall so close to the power I sought!", MESSAGE_SAY);
            mob:useMobAbility(438); -- Do Invincible!
            mob:setLocalVar("Minerva_2hr", 5);
        elseif (Minerva_2hr_Used == 5 and Ambrosia == 0) then
            mob:SpoofChatParty("Olympus hear me! Grant me the last of our power for this task!", MESSAGE_SAY);
            mob:useMobAbility(1231);
            mob:setLocalVar("Minerva_Ambrosia", 1);
        elseif (Minerva_2hr_Used == 5 and Ambrosia == 1) then
            mob:useMobAbility(2102); -- Do Tabula Rasa! Single target nukes now AoE yet do full dmg to all targets.
            mob:setLocalVar("Minerva_2hr", 6);
        end
    elseif (mob:getHPP() <= 40) then -- 3rd Chainspell time!
        if (Minerva_2hr_Used == 3) then
            mob:SpoofChatParty("Your dimension must collapse that mine may be spared!", MESSAGE_SAY);
            mob:useMobAbility(436); -- Do 3rd Chainspell!
            mob:setLocalVar("Minerva_2hr", 4);
        end
    elseif (mob:getHPP() <= 60) then -- Manafont and Chainspell together!
        if (Minerva_2hr_Used == 1) then
            mob:useMobAbility(435); -- Do Manafont!
            mob:SpoofChatParty("You are the one who defeated Mars?", MESSAGE_SAY);
            mob:setLocalVar("Minerva_2hr", 2);
        elseif (Minerva_2hr_Used == 2) then
            mob:SpoofChatParty("He was but a brute, I am the goddess of wisdom and strategy!", MESSAGE_SAY);
            mob:useMobAbility(436); -- Do 2nd Chainspell!
            mob:setLocalVar("Minerva_2hr", 3);
        end
    elseif (mob:getHPP() <= 80) then -- 1st Chainspell time!
        if (Minerva_2hr_Used == 0) then
            mob:SpoofChatParty("For Olympus!", MESSAGE_SAY);
            mob:useMobAbility(436); -- Do 1st Chainspell!
            mob:setLocalVar("Minerva_2hr", 1);
        end
    end
end;

-----------------------------------
-- onSpellPrecast Action
-----------------------------------

function onSpellPrecast(mob, spell)
    if (mob:hasStatusEffect(EFFECT_TABULA_RASA)) then
        spell:setAoE(SPELLAOE_RADIAL);
        -- spell:setFlag(SPELLFLAG_HIT_ALL);
        spell:setRadius(20);
        spell:setMPCost(1);
    end
end

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(mob,target,damage)
    local dmg = math.random(3,11); -- Using "damage" resulted in insane values...
    local IntMndBonus = 0;
    -- target:PrintToPlayer( string.format( "Enspell base Dmg: '%u' ", dmg ) );
    local INT_diff = mob:getStat(MOD_INT) - target:getStat(MOD_INT);
    local MND_diff = mob:getStat(MOD_MND) - target:getStat(MOD_MND);
    if (mob:hasStatusEffect(EFFECT_MINERVA_ENLIGHT) == true) then
        mob:SetMobSkillAttack(false); -- Disable Special Animation for melee attacks during effect.
        if (INT_diff > 20) then
            INT_diff = 20 + (INT_diff - 20);
            INT_diff = INT_diff * 0.34;
        end

        if (MND_diff > 20) then
            MND_diff = 20 + (MND_diff - 20);
            MND_diff = MND_diff * 0.5;
        end
        IntMndBonus = INT_diff + MND_diff;
        IntMndBonus = IntMndBonus * 0.2;
        -- target:PrintToPlayer( string.format( "Enspell int+mnd bonus: '%u' ", IntMndBonus) );
        dmg = dmg + IntMndBonus;
        dmg = dmg -10; -- Minerva's EnLight doesn't hit as hard as her Enthunder
        -- target:PrintToPlayer( string.format( "Enspell Dmg before clamp: '%u' ", dmg ) );
        dmg = utils.clamp(dmg, 20, 40);
        if (math.random(0,99) >= 66) then
            target:delMP(dmg * 0.5);
            target:delTP(dmg * 0.25)
            if (mob:getLocalVar("Minerva_Boost_from_Enspell") == nil) then
                Enspell_Enfeeb = 0;
            else
                Enspell_Enfeeb = mob:getLocalVar("Minerva_Boost_from_Enspell");
            end
            Enspell_Enfeeb = Enspell_Enfeeb + 1
            mob:setLocalVar("Minerva_Boost_from_Enspell", Enspell_Enfeeb);
            target:delStatusEffectSilent(EFFECT_MAGIC_DEF_DOWN);
            target:addStatusEffect(EFFECT_MAGIC_DEF_DOWN,Enspell_Enfeeb * 5,0,150);
            -- target:PrintToPlayer( string.format( "Enspell Dmg after clamp: '%u' ", dmg ) );
            return SUBEFFECT_LIGHT_DAMAGE,163,dmg;
        else
            target:delMP(dmg * 0.5);
            target:delTP(dmg * 0.25)
            -- target:PrintToPlayer( string.format( "Enspell Dmg after clamp: '%u' ", dmg ) );
            return SUBEFFECT_LIGHT_DAMAGE,163,dmg;
        end
    elseif (mob:hasStatusEffect(EFFECT_MINERVA_ENTHUNDER) == true) then
        mob:SetMobSkillAttack(false); -- Disable Special Animation for melee attacks during effect.
        if (INT_diff > 20) then
            INT_diff = 20 + (INT_diff - 20);
            INT_diff = INT_diff * 0.5;
        end

        if (MND_diff > 20) then
            MND_diff = 20 + (MND_diff - 20);
            MND_diff = MND_diff * 0.34;
        end
        IntMndBonus = INT_diff + MND_diff;
        IntMndBonus = IntMndBonus * 0.20;
        -- target:PrintToPlayer( string.format( "Enspell int+mnd bonus: '%u' ", IntMndBonus) );
        dmg = dmg + IntMndBonus;
        dmg = dmg + 15; -- Minerva's Enthunder hits harder than her Enlight
        -- target:PrintToPlayer( string.format( "Enspell Dmg before clamp: '%u' ", dmg ) );
        dmg = utils.clamp(dmg, 40, 80);
        if (math.random(0,99) >= 66) then
            if (mob:getLocalVar("Minerva_Boost_from_Enspell") == nil) then
                Enspell_Enfeeb = 0;
            else
                Enspell_Enfeeb = mob:getLocalVar("Minerva_Boost_from_Enspell");
            end
            Enspell_Enfeeb = Enspell_Enfeeb + 1
            mob:setLocalVar("Minerva_Boost_from_Enspell", Enspell_Enfeeb);
            target:delStatusEffectSilent(EFFECT_MAGIC_EVASION_DOWN);
            target:addStatusEffect(EFFECT_MAGIC_EVASION_DOWN,Enspell_Enfeeb * 10,0,150);
            -- target:PrintToPlayer( string.format( "Enspell Dmg after clamp: '%u' ", dmg ) );
            return SUBEFFECT_LIGHTNING_DAMAGE,163,dmg;
        else
            -- target:PrintToPlayer( string.format( "Enspell Dmg after clamp: '%u' ", dmg ) );
            return SUBEFFECT_LIGHTNING_DAMAGE,163,dmg;
        end
    else
        mob:SetMobSkillAttack(true); -- Re-enable Special Animation for melee attacks.
        mob:setLocalVar("Minerva_Boost_from_Enspell", 0);
        return 0,0,0;
    end
end;

-----------------------------------
-- onSpikesDamage
-----------------------------------

function onSpikesDamage(mob,target,damage)
    local dmg = math.random(3,11); -- Using "damage" resulted in insane values...
    -- target:PrintToPlayer( string.format( "Spikes base Dmg: '%u' ", dmg ) );
    local MND_diff = mob:getStat(MOD_MND) - target:getStat(MOD_MND);
    local INT_diff = mob:getStat(MOD_INT) - target:getStat(MOD_INT);
    if (mob:hasStatusEffect(EFFECT_REPRISAL) == true) then
        if (INT_diff > 20) then
            INT_diff = 20 + (INT_diff - 20);
            INT_diff = INT_diff * 0.34;
        end

        if (MND_diff > 20) then
            MND_diff = 20 + (MND_diff - 20);
            MND_diff = MND_diff * 0.5;
        end
        IntMndBonus = INT_diff + MND_diff;
        IntMndBonus = IntMndBonus * 0.2;
        -- target:PrintToPlayer( string.format( "Spikes int+mnd bonus: '%u' ", IntMndBonus) );
        dmg = dmg + IntMndBonus;
        dmg = dmg -10; -- Minerva's Light Spikes don't hit as hard as her Shock Spikes
        -- target:PrintToPlayer( string.format( "Spikes Dmg before clamp: '%u' ", dmg ) );
        dmg = utils.clamp(dmg, 20, 40);
        if (math.random(0,99) >= 66) then
            if (mob:getLocalVar("Minerva_Boost_from_Spikes") == nil) then
                Magic_Boost = 0;
            else
                Magic_Boost = mob:getLocalVar("Minerva_Boost_from_Spikes");
            end
            Magic_Boost = Magic_Boost + 1;
            if (Magic_Boost > 200) then
                Magic_Boost = 200;
            end
            mob:setLocalVar("Minerva_Boost_from_Spikes", Magic_Boost);
            mob:delStatusEffectSilent(EFFECT_MAGIC_ATK_BOOST);
            mob:delStatusEffectSilent(EFFECT_MAGIC_ACC_BOOST_II);
            mob:addStatusEffect(EFFECT_MAGIC_ATK_BOOST,Magic_Boost * 2,0,0);
            mob:addStatusEffect(EFFECT_MAGIC_ACC_BOOST_II,Magic_Boost * 5,0,0);
            -- target:PrintToPlayer( string.format( "Spikes Dmg after clamp: '%u' ", dmg ) );
            return SUBEFFECT_REPRISAL,44,dmg;
        else
            -- target:PrintToPlayer( string.format( "Spikes Dmg after clamp: '%u' ", dmg ) );
            return SUBEFFECT_REPRISAL,44,dmg;
        end
    elseif (mob:hasStatusEffect(EFFECT_SHOCK_SPIKES) == true) then
        if (INT_diff > 20) then
            INT_diff = 20 + (INT_diff - 20);
            INT_diff = INT_diff * 0.5;
        end

        if (MND_diff > 20) then
            MND_diff = 20 + (MND_diff - 20);
            MND_diff = MND_diff * 0.34;
        end     IntMndBonus = INT_diff + MND_diff;
        IntMndBonus = IntMndBonus * 0.2;
        -- target:PrintToPlayer( string.format( "Spikes int+mnd bonus: '%u' ", IntMndBonus) );
        dmg = dmg + IntMndBonus;
        dmg = dmg + 15; -- Minerva's Shock Spikes hit harder than her Light Spikes
        -- target:PrintToPlayer( string.format( "Spikes Dmg before clamp: '%u' ", dmg ) );
        dmg = utils.clamp(dmg, 40, 80);
        -- target:PrintToPlayer( string.format( "Spikes Dmg after clamp: '%u' ", dmg ) );
        return SUBEFFECT_SHOCK_SPIKES,44,dmg;
    else
        mob:setLocalVar("Minerva_Boost_from_Spikes", 0);
        return 0,0,0;
    end
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob,killer)
    if (killer:getParty() ~= nil) then
        local targets = killer:getParty(); -- local targets = mob:getEnmityList();
        for hey, dude in pairs(targets) do
            if (dude:isPC()) then
                dude:ChangeMusic(0, 0); -- Background Music (Day time, 7:00 -> 18:00)
                dude:ChangeMusic(1, 0); -- Background Music (Night time, 18:00 -> 7:00)
                dude:ChangeMusic(2, 187); -- SoloBattle Music
                dude:ChangeMusic(3, 187); -- Party Battle Music
            end
        end
    elseif (killer:isPC()) then
        killer:ChangeMusic(0, 0); -- Background Music (Day time, 7:00 -> 18:00)
        killer:ChangeMusic(1, 0); -- Background Music (Night time, 18:00 -> 7:00)
        killer:ChangeMusic(2, 187); -- SoloBattle Music
        killer:ChangeMusic(3, 187); -- Party Battle Music
    end

    -- mob:SpoofChatParty("victory message here", MESSAGE_SAY)
    -- mob:getBattlefield():win();
end;