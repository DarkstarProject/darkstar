-----------------------------------
--
-- Functions for LegionXI custom trials content
-- Author: Teo & Omni LegionFFXI
-----------------------------------
require("scripts/globals/utils");
-----------------------------------

-- ID Tables
local Relic1 = {18318, 15070, 18336, 18306, 18294, 18330, 18276, 18342, 18300, 18288, 18312, 18270, 18324, 18282, 18264, 18348}
local Relic2 = {18646, 16196, 18649, 18644, 18642, 18648, 18639, 18578, 18643, 18641, 18645, 18638, 18647, 18640, 18637, 18650}
local Relic3 = {18674, 16198, 18677, 18672, 18670, 18676, 18667, 18580, 18671, 18669, 18673, 18666, 18675, 18668, 18665, 18678}
-- local Relic4 = {19755, 11927, 19758, 19753, 19751, 19757, 19748, 18572, 19752, 19750, 19754, 19747, 19756, 19749, 19746, 19759}
local Mythic1 = {18999, 18997, 19000, 18991, 19007, 19001, 18992, 19002, 18994, 18998, 18995, 19003, 19005, 19004, 18989, 19006, 18990}
local Mythic2 = {19088, 19086, 19089, 19080, 19096, 19090, 19081, 19091, 19803, 19087, 19084, 19092, 19094, 19093, 19098, 19095, 19099}
local Mythic3 = {19718, 19716, 19719, 19710, 19726, 19720, 19711, 19721, 19713, 19717, 19714, 19722, 19724, 19723, 19728, 19725, 19729}
-- local Mythic4 = {19827, 19825, 19828, 19819, 19835, 19829, 19820, 19830, 19822, 19826, 19823, 19831, 19962, 19832, 19837, 19834, 19838}


-- function doCustomTrial(mob, killer, isKillShot, killType)
function doCustomTrial(mob, killer, isKillShot, isWeaponSkillKill)
	---------------------------------------------------
	-- Custom Trials
	---------------------------------------------------
	local TRIAL = killer:getVar("CustomTrial");
	local partyType = killer:checkSoloPartyAlliance();
	local RANGED = killer:getEquipID(SLOT_RANGED);
	local MAIN = killer:getEquipID(SLOT_MAIN);
	local SUB = killer:getEquipID(SLOT_SUB);
	-- killer:PrintToPlayer(string.format("Trial ID: %u ", TRIAL));
	-- killer:PrintToPlayer(string.format("RANGED %u ", RANGED));
	-- killer:PrintToPlayer(string.format("MAIN: %u ", MAIN));
	-- killer:PrintToPlayer(string.format("SUB: %u ", SUB));
	---------------------
	-- Relic 1 75-85
	---------------------

	local SewwTheSquidLimbedKillCount = 0;
	local MegalobugardKillCount = 0;
	local DuneWidowKillCount = 0;
	local MischievousCount = 0;
	local IntuloKillCount = 0;
	local KeeperKillCount = 0;

	if (killer:getVar("Seww_the_Squidlimbed_KILLS") ~= nil) then
		SewwTheSquidLimbedKillCount = killer:getVar("Seww_the_Squidlimbed_KILLS")
	end
	if (killer:getVar("Mischievous_Micholas_KILLS") ~= nil) then
		MischievousCount = killer:getVar("Mischievous_Micholas_KILLS")
	end
	if (killer:getVar("Megalobugard_KILLS") ~= nil) then
		MegalobugardKillCount = killer:getVar("Megalobugard_KILLS")
	end
	if (killer:getVar("Keeper_of_Halidom_KILLS") ~= nil) then
		KeeperKillCount = killer:getVar("Keeper_of_Halidom_KILLS")
	end
	if (killer:getVar("Dune_Widow_KILLS") ~= nil) then
		DuneWidowKillCount = killer:getVar("Dune_Widow_KILLS")
	end
	if (killer:getVar("Intulo_KILLS") ~= nil) then
		IntuloKillCount = killer:getVar("Intulo_KILLS")
	end

	---------------------
	-- Trial start count
	---------------------

	if (utils.inTable(Relic1, TRIAL) == true and (MAIN == TRIAL or SUB == TRIAL or RANGED == TRIAL)) then
		if (SewwTheSquidLimbedKillCount < 4 and mob:getID() == 17498301) then
			killer:setVar("Seww_the_Squidlimbed_KILLS", SewwTheSquidLimbedKillCount + 1);
		end
		if (MischievousCount < 4 and mob:getID() == 17281149) then
			killer:setVar("Mischievous_Micholas_KILLS", MischievousCount + 1);
		end
		if (KeeperKillCount < 4 and mob:getID() == 17272978) then
			killer:setVar("Keeper_of_Halidom_KILLS", KeeperKillCount + 1);
		end
		if (MegalobugardKillCount < 4 and mob:getID() == 16875741) then
			killer:setVar("Megalobugard_KILLS", MegalobugardKillCount + 1);
		end
		if (DuneWidowKillCount < 3 and mob:getID() == 17244396) then
			killer:setVar("Dune_Widow_KILLS", DuneWidowKillCount + 1);
		end
		if (IntuloKillCount < 4 and mob:getID() == 16793742) then
			killer:setVar("Intulo_KILLS", IntuloKillCount + 1);
		end

		------------------
		-- Trial complete
		------------------

		if (MegalobugardKillCount == 4 and SewwTheSquidLimbedKillCount == 4 and MischievousCount == 4 and
			Dune_WidowKillCount == 3 and Keeper_of_HalidomKillCount == 4 and  IntuloKillCount == 4) then
			killer:setVar("TRIAL_COMPLETE", 1);
		end
	end

	---------------------
	-- Relic 2 85-95
	---------------------
	local AdamantoiseKillCount = 0;
	local BehemothKillCount = 0;
	local FafnirKillCount = 0;

	if (killer:getVar("Adamantoise_KILLS") ~= nil) then
		AdamantoiseKillCount = killer:getVar("Adamantoise_KILLS")
	end

	if (killer:getVar("Behemoth_KILLS") ~= nil) then
		BehemothKillCount = killer:getVar("Behemoth_KILLS")
	end

	if (killer:getVar("Fafnir_KILLS") ~= nil) then
		FafnirKillCount = killer:getVar("Fafnir_KILLS")
	end

	---------------------
	-- Trial start count
	---------------------

	if (utils.inTable(Relic2, TRIAL) == true and (MAIN == TRIAL or SUB == TRIAL or RANGED == TRIAL)) then
		if (AdamantoiseKillCount < 7 and mob:getID() == 17301537) then
			killer:setVar("Adamantoise_KILLS", AdamantoiseKillCount + 1);
		end
		if (BehemothKillCount < 7 and mob:getID() == 17297440) then
			killer:setVar("Behemoth_KILLS", BehemothKillCount + 1);
		end
		if (FafnirKillCount < 7 and mob:getID() == 17408018) then
			killer:setVar("Fafnir_KILLS", FafnirKillCount + 1);
		end

		------------------
		-- Trial complete
		------------------

		if (AdamantoiseKillCount == 7 and BehemothKillCount == 7 and FafnirKillCount == 7) then
			killer:setVar("TRIAL_COMPLETE", 1);
		end
	end

	---------------------
	-- Relic 3 95-99
	---------------------

	local AspidocheloneKillCount = 0;
	local KingBehemothKillCount = 0;
	local AshDragonKillCount = 0;
	local JugglerKillCount = 0;
	local NidhoggKillCount = 0;

	if (killer:getVar("Aspidochelone_KILLS") ~= nil) then
		AspidocheloneKillCount = killer:getVar("Aspidochelone_KILLS")
	end
	if (killer:getVar("King_Behemoth_KILLS") ~= nil) then
		KingBehemothKillCount = killer:getVar("King_Behemoth_KILLS")
	end
	if (killer:getVar("Juggler_Hecatomb_KILLS") ~= nil) then
		JugglerKillCount = killer:getVar("Juggler_Hecatomb_KILLS")
	end
	if (killer:getVar("Ash_Dragon_KILLS") ~= nil) then
		AshDragonKillCount = killer:getVar("Ash_Dragon_KILLS")
	end
	if (killer:getVar("Nidhogg_KILLS") ~= nil) then
		NidhoggKillCount = killer:getVar("Nidhogg_KILLS")
	end

	if (utils.inTable(Relic3, TRIAL) == true and (MAIN == TRIAL or SUB == TRIAL or RANGED == TRIAL)) then
		if (JugglerKillCount < 4 and mob:getID() == 17580248) then
			killer:setVar("Juggler_Hecatomb_KILLS", JugglerKillCount + 1);
		end
		if (NidhoggKillCount < 4 and mob:getID() == 17408019) then
			killer:setVar("Nidhogg_KILLS", NidhoggKillCount + 1);
		end
		if (KingBehemothKillCount < 4 and mob:getID() == 17297441) then
			killer:setVar("King_Behemoth_KILLS", KingBehemothKillCount + 1);
		end
		if (AspidocheloneKillCount < 3 and mob:getID() == 17301538) then
			killer:setVar("Aspidochelone_KILLS", AspidocheloneKillCount + 1);
		end
		if (AshDragonKillCount < 4 and mob:getID() == 17617147) then
			killer:setVar("Ash_Dragon_KILLS", AshDragonKillCount + 1);
		end
		------------------
		-- Trial complete
		------------------
		if (JugglerKillCount == 4 and NidhoggKillCount == 4 and KingBehemothKillCount == 4 and
			AspidocheloneKillCount == 3 and AshDragonKillCount == 4) then
			killer:setVar("TRIAL_COMPLETE", 1);
		end
	end

	---------------------
	-- Mythic 1 75-85
	---------------------
	local BrassBorerKillCount = 0;
	local ZareehklKillCount = 0;
	local VelionisKillCount = 0;
	local DextroseKillCount = 0;
	local IririKillCount = 0;
	local IrizKillCount = 0;

	if (killer:getVar("Zareehkl_the_Jubilant_KILLS") ~= nil) then
		ZareehklKillCount = killer:getVar("Zareehkl_the_Jubilant_KILLS")
	end
	if (killer:getVar("Brass_Borer_KILLS") ~= nil) then
		BrassBorerKillCount = killer:getVar("Brass_Borer_KILLS")
	end
	if (killer:getVar("Iriri_Samariri_KILLS") ~= nil) then
		IririKillCount = killer:getVar("Iriri_Samariri_KILLS")
	end
	if (killer:getVar("Dextrose_KILLS") ~= nil) then
		DextroseKillCount = killer:getVar("Dextrose_KILLS")
	end
	if (killer:getVar("Velionis_KILLS") ~= nil) then
		VelionisKillCount = killer:getVar("Velionis_KILLS")
	end
	if (killer:getVar("Iriz_Irma_KILLS") ~= nil) then
		IrizKillCount = killer:getVar("Iriz_Irma_KILLS")
	end

	---------------------
	-- Trial start count
	---------------------

	if (utils.inTable(Mythic1, TRIAL) == true and (MAIN == TRIAL or SUB == TRIAL or RANGED == TRIAL)) then
		if (ZareehklKillCount < 5 and mob:getID() == 16998873) then
			killer:setVar("Zareehkl_the_Jubilant_KILLS", ZareehklKillCount + 1);
		end
		if (BrassBorerKillCount < 5 and mob:getID() == 17027471) then
			killer:setVar("Brass_Borer_KILLS", BrassBorerKillCount + 1);
		end
		if (IririKillCount < 5 and mob:getID() == 17043888) then
			killer:setVar("Iriri_Samariri_KILLS", IririKillCount + 1);
		end
		if (VelionisKillCount < 5 and mob:getID() == 16998872) then
			killer:setVar("Velionis_KILLS", VelionisKillCount + 1);
		end
		if (DextroseKillCount < 5 and mob:getID() == 17031598) then
			killer:setVar("Dextrose_KILLS", DextroseKillCount + 1);
		end
		if (IrizKillCount < 5 and mob:getID() == 16986429) then
			killer:setVar("Iriz_Irma_KILLS", IrizKillCount + 1);
		end

		------------------
		-- Trial complete
		------------------

		if (ZareehklKillCount == 5 and BrassBorerKillCount == 5 and IririKillCount == 5 and
			VelionisKillCount == 5 and DextroseKillCount == 5 and IrizKillCount == 5) then
			killer:setVar("TRIAL_COMPLETE", 1);
		end
	end

	---------------------
	-- Mythic 2 85-95
	---------------------

	local ExperimentalLamiaKillCount = 0;
	local NosferatuKillCount = 0;
	local AchamothKillCount = 0;
	local GearsKillCount = 0;

	if (killer:getVar("Experimental_Lamia_KILLS") ~= nil) then
		ExperimentalLamiaKillCount = killer:getVar("Experimental_Lamia_KILLS")
	end
	if (killer:getVar("Nosferatu_KILLS") ~= nil) then
		NosferatuKillCount = killer:getVar("Nosferatu_KILLS")
	end
	if (killer:getVar("Armed_Gears_KILLS") ~= nil) then
		GearsKillCount = killer:getVar("Armed_Gears_KILLS")
	end
	if (killer:getVar("Achamoth_KILLS") ~= nil) then
		AchamothKillCount = killer:getVar("Achamoth_KILLS")
	end

	---------------------
	-- Trial start count
	---------------------

	if (utils.inTable(Mythic2, TRIAL) == true and (MAIN == TRIAL or SUB == TRIAL or RANGED == TRIAL)) then
		if (ExperimentalLamiaKillCount < 4 and mob:getID() == 17101205) then
			killer:setVar("Expermimental_Lamia_KILLS", ExperimentalLamiaKillCount + 1);
		end
		if (NosferatuKillCount < 4 and mob:getID() == 17056158) then
			killer:setVar("Nosferatu_KILLS", NosferatuKillCount + 1);
		end
		if (GearsKillCount < 4 and mob:getID() == 17072178) then
			killer:setVar("Armed_Gears_KILLS", GearsKillCount + 1);
		end
		if (AchamothKillCount < 4 and mob:getID() == 17031600) then
			killer:setVar("Achamoth_KILLS", AchamothKillCount + 1);
		end

		------------------
		-- Trial complete
		------------------

		if (ExperimentalLamiaKillCount == 4 and NosferatuKillCount == 4 and
			GearsKillCount == 4 and AchamothKillCount == 4) then
			killer:setVar("TRIAL_COMPLETE", 1);
		end
	end

	---------------------
	-- Mythic 2 95-99
	---------------------
	local CerberusKillCount = 0;
	local KhimaraKillCount = 0;
	local MedusaKillCount = 0;
	local GuloolKillCount = 0;
	local GurfurlurKillCount = 0;
	local HydraKillCount = 0;

	if (killer:getVar("Gurfurlur_the_Menacing_KILLS") ~= nil) then
		GurfurlurKillCount = killer:getVar("Gurfurlur_the_Menacing_KILLS")
	end
	if (killer:getVar("Gulool_Ja_Ja_KILLS") ~= nil) then
		GuloolKillCount = killer:getVar("Gulool_Ja_Ja_KILLS")
	end
	if (killer:getVar("Cerberus_KILLS") ~= nil) then
		CerberusKillCount = killer:getVar("Cerberus_KILLS")
	end
	if (killer:getVar("Khimara_KILLS") ~= nil) then
		KhimaraKillCount = killer:getVar("Khimara_KILLS")
	end
	if (killer:getVar("Medusa_KILLS") ~= nil) then
		MedusaKillCount = killer:getVar("Medusa_KILLS")
	end
	if (killer:getVar("Hydra_KILLS") ~= nil) then
		HydraKillCount = killer:getVar("Hydra_KILLS")
	end

	---------------------
	-- Trial start count
	---------------------

	if (utils.inTable(Mythic3, TRIAL) == true and (MAIN == TRIAL or SUB == TRIAL or RANGED == TRIAL)) then
		if (GurfurlurKillCount < 3 and mob:getID() == 17031592) then
			killer:setVar("Gurfurlur_the_Menacing_KILLS", GurfurlurKillCount + 1);
		end
		if (GuloolKillCount < 3 and mob:getID() == 16973900) then
			killer:setVar("Gulool_Ja_Ja_KILLS", GuloolKillCount + 1);
		end
		if (CerberusKillCount < 3 and mob:getID() == 17027458) then
			killer:setVar("Cerberus_KILLS", CerberusKillCount + 1);
		end
		if (KhimaraKillCount < 3 and mob:getID() == 17101201) then
			killer:setVar("Khimara_KILLS", KhimaraKillCount + 1);
		end
		if (MedusaKillCount < 3 and mob:getID() == 16998862) then
			killer:setVar("Medusa_KILLS", MedusaKillCount + 1);
		end
		if (HydraKillCount < 3 and mob:getID() == 16986355) then
			killer:setVar("Hydra_KILLS", HydraKillCount + 1);
		end

		------------------
		-- Trial complete
		------------------

		if (GurfurlurKillCount == 3 and GuloolKillCount == 3 and CerberusKillCount == 3 and
			KhimaraKillCount == 3 and MedusaKillCount == 3 and HydraKillCount == 3) then
			killer:setVar("TRIAL_COMPLETE", 1);
		end
	end

end;