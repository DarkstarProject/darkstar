++-----------------------------------------
+-- Spell: Aero VI
+-- Deals wind damage to an enemy.
+-----------------------------------------
+
+require("scripts/globals/magic");
+require("scripts/globals/status");
+
+-----------------------------------------
+-- OnSpellCast
+-----------------------------------------
+
+function onMagicCastingCheck(caster, target, spell)
+    return 0;
+end;
+
+function onSpellCast(caster, target, spell)
+    local spellParams = {};
+    spellParams.hasMultipleTargetReduction = false;
+    spellParams.resistBonus = 1.0;
     spellParams.V0 = 1350;
+    spellParams.V50 = 1100;
+    spellParams.V100 = 1590;
+    spellParams.V200 = 2100;
+    spellParams.M0 = 4.35;
+    spellParams.M50 = 4.74;
+    spellParams.M100 = 4.75;
+    spellParams.M200 = 4;

+    return doElementalNuke(caster, spell, target, spellParams);
+end;
