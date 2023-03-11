function onCreate()
	if downscroll then
		barY = getPropertyFromClass('flixel.FlxG', 'height')/2 - (50 * 6)
	else
		barY = getPropertyFromClass('flixel.FlxG', 'height') - (14 * 6)
	end
	makeLuaSprite('bg','bg',0, -50)
	setScrollFactor('bg', 0, 0)
	setObjectCamera('bg', 'hud')
	setProperty('bg.antialiasing', false)
	addLuaSprite('bg',false)
	

	makeLuaSprite('score','score',174, 680)
	setScrollFactor('score', 0, 0)
	setObjectCamera('score', 'hud')
	setProperty('score.antialiasing', false)
	scaleObject('score', 3.4, 3.4)
	addLuaSprite('score',false)

	makeLuaText('scoreSMB1', '000000', 0, 365, 666)
	setProperty('scoreSMB1.borderSize', 0)
	setProperty('scoreSMB1.antialiasing', false)
	setTextFont('scoreSMB1', 'smb1.ttf')
	setTextSize('scoreSMB1', 8*7, 8*7)
	setScrollFactor('scoreSMB1', 0, 0)
	addLuaText('scoreSMB1')

end

function onCreatePost()
	for b = 0, getProperty('unspawnNotes.length') - 1 do
		setPropertyFromGroup('unspawnNotes', b, 'antialiasing', false)
	end
	
	curRating = floorDecimal(getProperty('ratingPercent') * 100, 2)
	splitRating = mysplit(tostring(curRating), '.')
	
	makeLuaText('accuracyTxt1', '000', 137, 0, 666)
	setProperty('accuracyTxt1.borderSize', 0)
	setProperty('accuracyTxt1.antialiasing', false)
	setTextFont('accuracyTxt1', 'smb1.ttf')
	setTextSize('accuracyTxt1', 8*7, 8*7)
	setScrollFactor('accuracyTxt1', 0, 0)
	setProperty('accuracyTxt1.x', getPropertyFromClass('flixel.FlxG', 'width') - (64 * 6))
	addLuaText('accuracyTxt1')
	
	makeLuaText('accuracyTxt2', '.00%', 0, 0, 686)
	setProperty('accuracyTxt2.borderSize', 0)
	setProperty('accuracyTxt2.antialiasing', false)
	setTextFont('accuracyTxt2', 'sonicdebugfont.ttf')
	setTextSize('accuracyTxt2', 22, 22)
	setScrollFactor('accuracyTxt2', 0, 0)
	setProperty('accuracyTxt2.x', getProperty('accuracyTxt1.x') + (18 * 6))
	addLuaText('accuracyTxt2')

	makeLuaSprite('%','%',getProperty('accuracyTxt1.x') + (20.8 * 10), 687)
	setScrollFactor('%', 0, 0)
	setObjectCamera('%', 'hud')
	setProperty('%.antialiasing', false)
	scaleObject('%', 4, 4)
	addLuaSprite('%',false)

	
	makeLuaText('botplayTxt', 'BOTPLAY', 0, getPropertyFromClass('flixel.FlxG', 'width')/2-(28*6)+2, getPropertyFromClass('flixel.FlxG', 'height')/2-(40*6))
	setProperty('botplayTxt.borderSize', 0)
	setProperty('botplayTxt.antialiasing', false)
	setTextFont('botplayTxt', 'smb1.ttf')
	setTextSize('botplayTxt', 8*6, 8*6)
	setScrollFactor('botplayTxt', 0, 0)
	setProperty('botplayTxt.visible', false)
	--addLuaText('botplayTxt')
	
	setProperty('timeBar.visible', false)
	setProperty('timeBarBG.visible', false)
	setProperty('timeTxt.visible', false)
end

math.round = function(num)
    return math.floor(num + 0.5)
end

local triggered = false
function onUpdate(elapsed)
	if curBeat == 0 and not triggered then
		triggered = true
			for b = 0, getProperty('opponentStrums.length') - 1 do
				setPropertyFromGroup('playerStrums', b, 'y', getPropertyFromGroup('playerStrums', b, 'y') - 8 * 6)
				setPropertyFromGroup('opponentStrums', b, 'y', getPropertyFromGroup('opponentStrums', b, 'y') - 8 * 6)
				setPropertyFromGroup('opponentStrums', b, 'antialiasing', false)
				setPropertyFromGroup('playerStrums', b, 'antialiasing', false)
			end
	end
	setTextString('scoreSMB1', score)
	if getProperty('scoreSMB1.text.length') == 1 then
		setTextString('scoreSMB1', "00000"..getProperty('scoreSMB1.text'))
	elseif getProperty('scoreSMB1.text.length') == 2 then
		setTextString('scoreSMB1', "0000"..getProperty('scoreSMB1.text'))
	elseif getProperty('scoreSMB1.text.length') == 3 then
		setTextString('scoreSMB1', "000"..getProperty('scoreSMB1.text'))
	elseif getProperty('scoreSMB1.text.length') == 4 then
		setTextString('scoreSMB1', "00"..getProperty('scoreSMB1.text'))
	elseif getProperty('scoreSMB1.text.length') == 5 then
		setTextString('scoreSMB1', "0"..getProperty('scoreSMB1.text'))
	end
	
	curRating = floorDecimal(getProperty('ratingPercent') * 100, 1)
	splitRating = mysplit(tostring(curRating), '.')
	
	if getProperty('ratingFC') == 'SFC' then
		splitRating[1] = '100'
		splitRating[2] = '00'
	end
	
	if #splitRating[1] == 1 then
		splitRating[1] = '00'..splitRating[1]
	elseif #splitRating[1] == 2 then	
		splitRating[1] = '0'..splitRating[1]
	end
	
	if #splitRating[2] == 1 then
		splitRating[2] = '0'..splitRating[2]
	end
	if #splitRating[2] == nil then	
		splitRating[2] = '00'
	end
	
	setTextString('accuracyTxt1', splitRating[1])
	setTextString('accuracyTxt2', '.'..splitRating[2]..'%')
	
	if getProperty('ratingFC') == 'SFC' then
		objectPlayAnimation('flagIcon', 'SFC', true)
	elseif getProperty('ratingFC') == 'GFC' then
		objectPlayAnimation('flagIcon', 'GFC', true)
	elseif getProperty('ratingFC') == 'FC' then
		objectPlayAnimation('flagIcon', 'FC', true)
	else
		removeLuaSprite('flagIcon')
	end
	
	if curRating >= 100 then
		objectPlayAnimation('ratingIcon', '7', true)
		setProperty('ratingIcon.y', barY + (1.5 * 6))
	elseif curRating >= 95 then
		objectPlayAnimation('ratingIcon', '6', true)
		setProperty('ratingIcon.y', barY + (0.5 * 6))
	elseif curRating >= 90 then
		objectPlayAnimation('ratingIcon', '5', true)
		setProperty('ratingIcon.y', barY + (0.5 * 6))
	elseif curRating >= 85 then
		objectPlayAnimation('ratingIcon', '4', true)
		setProperty('ratingIcon.y', barY + (0.5 * 6))
	elseif curRating >= 80 then
		objectPlayAnimation('ratingIcon', '3', true)
		setProperty('ratingIcon.y', barY + (0.5 * 6))
	elseif curRating >= 75 then
		objectPlayAnimation('ratingIcon', '2', true)
		setProperty('ratingIcon.y', barY + (0.5 * 6))
	elseif curRating <= 70 then
		objectPlayAnimation('ratingIcon', '1', true)
		setProperty('ratingIcon.y', barY + (0.5 * 6))
	end
end

function onUpdatePost(elapsed)
	for b = 0, getProperty('notes.length') - 1 do
		if getPropertyFromGroup('notes', b, 'isSustainNote') and getPropertyFromGroup('notes', b, 'alpha') ~= 1 then -- change 'if' to 'if not' for DD notes
			setPropertyFromGroup('notes', b, 'alpha', 1)
			setPropertyFromGroup('notes', b, 'offsetX', 31.5)
			if downscroll then
				setPropertyFromGroup('notes', b, 'offsetY', -20)
			end
		end
		if middlescroll and not getPropertyFromGroup('notes', b, 'mustPress') then
			setPropertyFromGroup('notes', b, 'alpha', 0)
		end
	end
	
	
	for b = 0, getProperty('grpNoteSplashes.length') - 1 do
		if getPropertyFromGroup('grpNoteSplashes', b, 'alpha') ~= 1 then
			setPropertyFromGroup('grpNoteSplashes', b, 'alpha', 1)
			setPropertyFromGroup('grpNoteSplashes', b, 'offset.x', -50)
			setPropertyFromGroup('grpNoteSplashes', b, 'offset.y', -45)
			setPropertyFromGroup('grpNoteSplashes', b, 'scale.x', 0.6)
			setPropertyFromGroup('grpNoteSplashes', b, 'scale.y', 0.6)
			setPropertyFromGroup('grpNoteSplashes', b, 'antialiasing', false)
		end
	end
end

function mysplit (inputstr, sep)
   if sep == nil then
      sep = "%s"
   end
   local t={}
   for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
      table.insert(t, str)
   end
   return t
end

function floorDecimal(value, decimals) --just a port of Highscore.floorDecimal
	if decimals < 1 then
		return math.floor(value)
	end
	
	local tempMult = 1
	for i=0, decimals do
		tempMult = tempMult * 10
	end
	newValue = math.floor(value * tempMult)
	return newValue / tempMult
end