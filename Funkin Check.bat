@echo off
setlocal enabledelayedexpansion

REM modo para burro
if "%~1"=="" (
    echo Drag the script over .bat
    pause
)

set "arquivo=%~1"

REM -- PSYCH 0.5.2H --

set vars52=Function_StopLua Function_StopHScript Function_StopAll modFolder songPath loadedSongName loadedSongPath chartPath curStage difficultyPath difficultyNameTranslation hasVocals curSection curDecBeat curDecStep combo deaths totalPlayed totalNotesHit playbackRate guitarHeroSustains shadersEnabled currentModDirectory noteSkin noteSkinPostfix splashSkin splashSkinPostfix splashAlpha

set functions52=onSpawnNote onKeyPressPre onKeyRealeasePre onKeyReleasePre onKeyPress onKeyRelease onGhostTap goodNoteHitPre opponentNoteHitPre preUpdateScore preUpdateScore onUpdateScore onEventPushed onCustomSubstateCreate onCustomSubstateCreatePost onCustomSubstateUpdate onCustomSubstateUpdatePost onCustomSubstateDestroy onSoundFinished onCheckForAchievement onCountdownStarted onGameOverStart

set comandos52=openCustomSubstate closeCustomSubstate initLuaShader setSpriteShader removeSpriteShader getShaderBool getShaderBoolArray getShaderInt getShaderIntArray getShaderFloat getShaderFloatArray setShaderBool setShaderBoolArray setShaderInt setShaderIntArray setShaderFloat setShaderFloatArray setShaderSampler2D getRunningScripts callOnLuas callScript isRunning runHaxeCode addHaxeLibrary keyboardJustPressed keyboardPressed keyboardReleased anyGamepadJustPressed anyGamepadPressed anyGamepadReleased gamepadAnalogX gamepadAnalogY gamepadJustPressed gamepadPressed gamepadReleased addAnimation addAnimationByIndicesLoop addOffset setHealthBarColors setTimeBarColors checkFileExists saveFile deleteFile setVar getVar playAnim setGlobalFromScript getGlobalFromScript insertToCustomSubstate setOnLuas isAchievementUnlocked unlockAchievement addAchievementScore setAchievementScore getAchievementScore achievementExists getModSetting makeFlxAnimateSprite loadAnimateAtlas addAnimationBySymbol addAnimationBySymbolIndices setTextHeight setTextAutoSize setOnHScript setOnScripts callOnScripts callOnHScript addHScript removeHScript getColorFromName getColorFromString FlxColor getSoundPitch setSoundPitch callMethod callMethodFromClass createInstance addInstance instanceArg loadMultipleFrames stringStartsWith stringEndsWith stringSplit stringSplit directoryFileList

REM -- PSYCH 0.6.3 --

set vars63=Function_StopHScript Function_StopAll modFolder loadedSongName loadedSongPath chartPath difficultyPath difficultyNameTranslation hasVocals curSection combo deaths totalPlayed totalNotesHit playbackRate guitarHeroSustains noteSkin noteSkinPostfix splashSkin splashSkinPostfix splashAlpha

set functions63=onSpawnNote onKeyPressPre onKeyRealeasePre onKeyReleasePre onKeyPress onKeyRelease onGhostTap goodNoteHitPre opponentNoteHitPre preUpdateScore preUpdateScore onUpdateScore onEventPushed onCustomSubstateCreate onCustomSubstateCreatePost onCustomSubstateUpdate onCustomSubstateUpdatePost onCustomSubstateDestroy onSoundFinished

set comandos63=clearUnusedMemory insertToCustomSubstate setOnLuas isAchievementUnlocked unlockAchievement addAchievementScore setAchievementScore getAchievementScore achievementExists getModSetting makeFlxAnimateSprite loadAnimateAtlas addAnimationBySymbol addAnimationBySymbolIndices setTextHeight setTextAutoSize setOnHScript setOnScripts callOnScripts callOnHScript addHScript removeHScript getColorFromName getColorFromString FlxColor getSoundPitch setSoundPitch callMethod callMethodFromClass createInstance addInstance instanceArg loadMultipleFrames

REM -- PSYCH 0.7.3 --

set vars73=modFolder loadedSongName loadedSongPath chartPath difficultyNameTranslation deaths totalPlayed totalNotesHit guitarHeroSustains

set functions73=onKeyPressPre onKeyRealeasePre onKeyReleasePre onGhostTap preUpdateScore preUpdateScore onUpdateScore onCheckForAchievement

set comandos73=clearUnusedMemory loadMultipleFrames

REM -- PSYCH 1.0.4 --

set functions104=onCheckForAchievement

set comandos104=clearUnusedMemory setGlobalFromScript getGlobalFromScript

echo.
echo directory: "%arquivo%"
echo.

call :verificarVersao "0.5.2h" vars52 functions52 comandos52
call :verificarVersao "0.6.3" vars63 functions63 comandos63
call :verificarVersao "0.7.3" vars73 functions73 comandos73
call :verificarVersao "1.0.4" vars104 functions104 comandos104

echo.
echo verification completed
echo created by marshverso(YT).
pause
exit /b

:verificarVersao
set "versao=%~1"
set "var=!%~2!"
set "function=!%~3!"
set "command=!%~4!"

echo ---Psych Engine %versao%---
echo.

echo =Variables=
for %%C in (!var!) do (
    findstr /C:"%%C" "%arquivo%" >nul
    if not errorlevel 1 (
        echo WARNING: The variable "%%C" does not exist in this Psych Rngine.
    )
)
echo.

echo =Functions=
for %%C in (!function!) do (
    findstr /C:"%%C" "%arquivo%" >nul
    if not errorlevel 1 (
        echo WARNING: The function "%%C()" does not exist in this Psych Rngine.
    )
)
echo.

echo =Commands=
for %%C in (!command!) do (
    findstr /C:"%%C" "%arquivo%" >nul
    if not errorlevel 1 (
        echo WARNING: The command "%%C()" does not exist in this Psych Rngine.
    )
)
echo.

exit /b