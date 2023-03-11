isChase = false
jumpedBrick = false
jumpedGap1 = false
jumpedGap2 = false
jumpedPipe = false

jumpedGapB = false
jumpedGapB2 = false
jumpedStairs = false
jumpedStairs2 = false
jumpedGap3 = false
jumpedGap3M = false
jumpedGap4M = false
jumpedGap4 = false
jumpTriggers = {}

chaseBGX = 0

mxLegsHighY = 0
mxLegsDefY = 0
bfLegsHighY = 0
bfLegsDefY = 0

breakableObjects = {}
legsSuffix = ''
pipeEnd = false
pipeTrigger = false

bfLegsPrefix = '-fire'
bfPrefix = 'bf-smb'
powerup = 2
dmgCooldown = 0
timeUntilPowerup = 0

allowCountdown = false
impact = false


function onCreatePost()
	makeAnimatedLuaSprite('firebgloop', 'firebgloop', 0, 0)
	addAnimationByPrefix('firebgloop', 'firebgloop', 'firebgloop', 20, true)
	objectPlayAnimation('firebgloop', 'firebgloop')
	setProperty('firebgloop.antialiasing', false)
	scaleObject('firebgloop', 9, 9)
	setObjectOrder('firebgloop', -9)
	addLuaSprite('firebgloop', false)
	setProperty('firebgloop.visible', true)
end


function onCreate()
	--setProperty('skipCountdown', true)
	--Iterate over all notes
	jumpTriggers[1] = jumpedBrick
	jumpTriggers[2] = jumpedGap1
	jumpTriggers[3] = jumpedGap2
	jumpTriggers[4] = jumpedPipe
	jumpTriggers[5] = jumpedGapB
	jumpTriggers[6] = jumpedGapB2
	jumpTriggers[7] = jumpedStairs
	jumpTriggers[8] = jumpedGap3
	jumpTriggers[9] = jumpedGap3M
	jumpTriggers[10] = jumpedStairs2
	jumpTriggers[11] = jumpedGap4
	jumpTriggers[12] = jumpedGap4M

	setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-dies')
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx-gameover')
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'intro1')
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'intro1')
	for i = 0, getProperty('unspawnNotes.length')-1 do
		setPropertyFromGroup('unspawnNotes', i, 'missHealth', 0); --Default value is: health lost on miss
	end
	
	ogHud = getPropertyFromClass('ClientPrefs', 'hideHud')
	setPropertyFromClass('ClientPrefs', 'hideHud', true)
end

function onDestroy()
	setPropertyFromClass('ClientPrefs', 'hideHud', ogHud)
end

function onStepHit()



	if curStep == 511 then
		setProperty('hello.visible', true)
	end

	if curStep <= 500 then
		setProperty('goal.visible', true)
		setObjectOrder('fgtransition', getObjectOrder('dadGroup')+0.1)
	end

	if curStep == 500 then
	makeAnimatedLuaSprite('fgtransition', 'fgtransition', 0, -390)
	addAnimationByPrefix('fgtransition', 'fgtransition', 'fgtransition', 10, false)
	objectPlayAnimation('fgtransition', 'fgtransition')
	setProperty('fgtransition.antialiasing', false)
	scaleObject('fgtransition', 4, 4)
	setObjectOrder('fgtransition', getObjectOrder('dadGroup')-1)
	addLuaSprite('fgtransition', true)
	setProperty('fgtransition.visible', true)
	setProperty('goal.visible', false)
	end

	if curStep >= 512 then
	setProperty('bganimated.visible', false)
	setProperty('bganimatedalt.visible', true)
	setProperty('fgalt.visible', true)
	setProperty('fgtransition.visible', false)
	end
	if curStep == 513 then
	setProperty('hello.visible', false)
	end

	if curStep >= 768 then
	setProperty('bganimatedalt.visible', false)
	setProperty('fgtransition.visible', false)
	setProperty('goal.visible', false)
	setProperty('fgalt.visible', false)
	end


	if curStep >= 1249 then
		setProperty('welcomeblack.visible', true)
		setProperty('brickscroll.visible', false)
	end
	if curStep >= 1252 then
		setProperty('welcome.visible', true)
	end
	if curStep >= 1260 then
		setProperty('welcomeback.visible', true)
		objectPlayAnimation('welcomeback', 'welcomeback')
	end
	if curStep <= 1248 and curStep >= 1260 then
		setProperty('welcomeblack.visible', false)
		setProperty('welcome.visible', false)
		setProperty('welcomeback.visible', false)
	end
	if curStep >= 1275 then
		setProperty('welcomeblack.visible', false)
		setProperty('welcome.visible', false)
		setProperty('welcomeback.visible', false)
		setProperty('brickscroll.visible', true)
	end
	if curStep >= 1528 then
		setProperty('brickscroll.visible', false)
		setProperty('tails.visible', true)
	end
	if curStep >= 1536 then
		setProperty('tails.visible', false)
	end


	if curStep == 2341 then
		setProperty('HAHAHA.visible', true)
		objectPlayAnimation('HAHAHA', 'HAHAHA')
		setProperty('loopAI.visible', false)
		setProperty('loop.visible', false)
		setProperty('firebgloop.visible', false)
	end
	if curStep == 2349 then

		makeAnimatedLuaSprite('firebgloop', 'firebgloop', 0, 0)
		addAnimationByPrefix('firebgloop', 'firebgloop', 'firebgloop', 20, true)
		objectPlayAnimation('firebgloop', 'firebgloop')
		setProperty('firebgloop.antialiasing', false)
		setObjectOrder('bgendloop', getObjectOrder('dadGroup')-4)
		scaleObject('firebgloop', 9, 9)
		addLuaSprite('firebgloop', false)

 
		makeAnimatedLuaSprite('fireloop', 'fireloop', -200, 140)
		addAnimationByPrefix('fireloop', 'fireloop', 'fireloop', 10, true)
		objectPlayAnimation('fireloop', 'fireloop')
		setProperty('fireloop.antialiasing', false)
		scaleObject('fireloop', 3.8, 3.8)
		setObjectOrder('fireloop', getObjectOrder('dadGroup')-3)
		addLuaSprite('fireloop', false)
		setProperty('fireloop.visible', true)

		doTweenX('theBFhasfallen','fireloop', 0, 1, 'quadOut')		


		setProperty('bfLegs.visible', false)
		setProperty('HAHAHA.visible', false)
		makeAnimatedLuaSprite('bgendloop', 'bgendloop', -1000, 0)
		addAnimationByPrefix('bgendloop', 'bgendloop', 'bgendloop', 10, true)
		objectPlayAnimation('bgendloop', 'bgendloop')
		setProperty('bgendloop.antialiasing', false)
		scaleObject('bgendloop', 4, 4)
		setObjectOrder('bgendloop', getObjectOrder('dadGroup')-1)
		addLuaSprite('bgendloop', true)
		setProperty('bgendloop.visible', true)

		doTweenX('hefallen','bgendloop', 0, 1, 'quadOut')


		makeLuaSprite('AIbgending', 'AIbgending', -400, -90)
		setProperty('AIbgending.antialiasing', false)
		scaleObject('AIbgending', 3.8, 3.8)
		setObjectOrder('bgendloop', getObjectOrder('dadGroup'))
		addLuaSprite('AIbgending')

		doTweenX('hehasfallen','AIbgending', 0, 1, 'quadOut')


	end
	
	if curStep == 2031 then
		setProperty('blackscreen.visible', true)
	end
	if curStep == 2036 then
		setProperty('you.visible', true)
	end
	if curStep == 2039 then
		setProperty('cant.visible', true)
	end
	if curStep == 2043 then
		setProperty('run.visible', true)
		triggerEvent('Pixel Cam Shake', '3, 2, 2', '0.025')
	end
	if curStep == 2048 then
		setProperty('you.visible', false)
		setProperty('cant.visible', false)
		setProperty('run.visible', false)
		setProperty('blackscreen.visible', false)
	end


	if curStep >= 2047 then
		setProperty('loop.visible', false)
		setProperty('loopAI.visible', true)
		setProperty('brickscroll.visible', false)
		setProperty('brickscrollAI.visible', true)	
		setProperty('firebgloop.visible', true)
		setProperty('fire.visible', true)
	end
	if curStep >= 2340 then
			isChase = false
			bfLegsHighY = 0
			bfLegsDefY = 0
			setProperty('bfPoint.y', 0)
	end
	if curStep >= 2348 then
	isChase = false
	setProperty('loopAI.visible', false)
	setProperty('loop.visible', false)
	setProperty('bfLegs.visible', false)

	end

	if curStep >= 2349 then
		setProperty('loopAI.visible', false)
		setProperty('pipe1.visible', false)
		setProperty('pipe2.visible', false)
	end

	if curStep == 2370 then

	end

	if curStep == 2729 then

		makeLuaSprite('blue', 'blue', 0, 0)
		setProperty('blue.antialiasing', false)
		scaleObject('blue', 9, 9)
		setObjectOrder('blue', getObjectOrder('dadGroup')-3)
		addLuaSprite('blue')
		setProperty('firebgloop.visible', false)
		scaleObject('fire', 0, 0)
 
		makeAnimatedLuaSprite('fireloopBLUE', 'fireloopBLUE', 0, 140)
		addAnimationByPrefix('fireloopBLUE', 'fireloopBLUE', 'fireloopBLUE', 10, true)
		objectPlayAnimation('fireloopBLUE', 'fireloopBLUE')
		setProperty('fireloopBLUE.antialiasing', false)
		scaleObject('fireloopBLUE', 3.8, 3.8)
		setObjectOrder('fireloopBLUE', getObjectOrder('dadGroup')-2)
		addLuaSprite('fireloopBLUE', false)
		setProperty('fireloopBLUE.visible', true)
		setProperty('fireloop.visible', false)

		makeLuaSprite('bgendblue', 'bgendblue', 0, 0)
		setProperty('bgendblue.antialiasing', false)
		scaleObject('bgendblue', 4, 4)
		setObjectOrder('bgendblue', getObjectOrder('dadGroup')-1)
		addLuaSprite('bgendblue')
		setProperty('bgendloop.visible', false)

		makeLuaSprite('AIbgendBLUE', 'AIbgendBLUE', 70, -90)
		setProperty('AIbgendBLUE.antialiasing', false)
		scaleObject('AIbgendBLUE', 3.8, 3.8)
		setObjectOrder('AIbgendBLUE', getObjectOrder('dadGroup')-0.1)
		addLuaSprite('AIbgendBLUE')
		setProperty('AIbgending.visible', false)
		
		setProperty('fire.visible', false)
	end

	if curStep == 2793 then
		setProperty('AIbgending.visible', true)
		setProperty('bgendloop.visible', true)
		setProperty('fireloop.visible', true)
		setProperty('firebgloop.visible', true)
		setProperty('AIbgendBLUE.visible', false)
		setProperty('bgendblue.visible', false)
		setProperty('fireloopBLUE.visible', false)
		setProperty('blue.visible', false)
		setProperty('fire.visible', true)
		scaleObject('fire', 4.7, 4.7)
	end
end



function onCreatePost()
	precacheImage('pcport/bf-die')
	precacheImage('bgscrollend')
	precacheImage('bgscrollAI')
	precacheImage('pcport/luigi')
	precacheImage('flower')
	precacheImage('bgscrollend')
	precacheImage('mushroom')
	addCharacterToList('bf-smb-small', 'boyfriend')
	addCharacterToList('bf-smb', 'boyfriend')
	
	addCharacterToList('bf-chase-small', 'boyfriend')
	addCharacterToList('bf-chase', 'boyfriend')
	addCharacterToList('bf-chase-fire', 'boyfriend')
	
	addCharacterToList('bf-wall-fire', 'boyfriend')
	addCharacterToList('bf-wall-small', 'boyfriend')
	addCharacterToList('bf-wall', 'boyfriend')
	
	addCharacterToList('mx', 'dad')
	addCharacterToList('marionear', 'dad')
	addCharacterToList('big-mx', 'dad')
	addCharacterToList('mx-angry', 'dad')
	addCharacterToList('mx-angry2', 'dad')

	makeAnimatedLuaSprite('bganimated', 'bganimated', 0, -350)
	addAnimationByPrefix('bganimated', 'bganimated', 'bganimated', 8, true)
	objectPlayAnimation('bganimated', 'bganimated')
	setProperty('bganimated.antialiasing', false)
	scaleObject('bganimated', 4, 4)
	setObjectOrder('bganimated', getObjectOrder('dadgroup')-10)
	addLuaSprite('bganimated', false)
	setProperty('bganimated.visible', true)

	
      makeLuaSprite('black2', 'exe/StartScreen/black', 0, 0)
	makeLuaSprite('Circle', 'exe/StartScreen/Circle-fight-or-flight', 800, 90)
	makeLuaSprite('Text', 'exe/StartScreen/Text-fight-or-flight', -800, 90)
	setObjectOrder('black2', 5)
	setObjectOrder('Circle', 6)
	setObjectOrder('Text', 7)
      setObjectCamera('black2', 'other')
      setObjectCamera('Circle', 'other')
      setObjectCamera('Text', 'other')	
      scaleObject('black2', 11111, 11111)
      scaleObject('Circle', 0.75, 0.75)
      scaleObject('Text', 0.75, 0.75)
      setProperty('black2.alpha', 1)
      addLuaSprite('black2', true)
      addLuaSprite('Circle', true)
      addLuaSprite('Text', true)

	makeAnimatedLuaSprite('HAHAHA', 'HAHAHA', 160, 50)
	addAnimationByPrefix('HAHAHA', 'HAHAHA', 'HAHAHA', 27, false)
	setProperty('HAHAHA.antialiasing', false)
	scaleObject('HAHAHA', 0.78, 0.78)
	addLuaSprite('HAHAHA', true)
	setProperty('HAHAHA.visible', false)
	setObjectCamera('HAHAHA', 'other')

	makeAnimatedLuaSprite('firebgloop', 'firebgloop', 0, 0)
	addAnimationByPrefix('firebgloop', 'firebgloop', 'firebgloop', 20, true)
	objectPlayAnimation('firebgloop', 'firebgloop')
	setProperty('firebgloop.antialiasing', false)
	scaleObject('firebgloop', 9, 9)
	setObjectOrder('firebgloop', 0)
	addLuaSprite('firebgloop', false)
	setProperty('firebgloop.visible', true)

		function onCountdownTick(counter)
	  	if counter == 1 then
			doTweenX('cercle', 'Circle', 190, 0.3, 'linear')
			doTweenX('text', 'Text', 180, 0.3, 'linear')
		end
		function onSongStart()
			doTweenAlpha('black2', 'black2', 0, 1.5, 'linear');
			doTweenAlpha('citcl', 'Circle', 0, 1.5, 'linear');
			doTweenAlpha('test', 'Text', 0, 1.5, 'linear');
		end
		end

	makeLuaSprite('border', 'border', -150, -80)
	setProperty('border.antialiasing', true)
	setObjectCamera('border', 'other')
	scaleObject('border', 1.25, 1.25)
	addLuaSprite('border')
	setObjectOrder('border', 10)

	makeLuaSprite('bleck', 'blackbox', 0, 600)
	setProperty('bleck.antialiasing', false)
	setObjectCamera('bleck', 'bleck')
	scaleObject('bleck', 5, 1)
	addLuaSprite('bleck', true)

	makeLuaSprite('bleck2', 'blackbox', 1200, -60)
	setProperty('bleck2.antialiasing', false)
	scaleObject('bleck2', 5, 3)
	addLuaSprite('bleck2', true)

		makeAnimatedLuaSprite('fire', 'fire', 0, 350)
		addAnimationByPrefix('fire', 'fire', 'fire', 10, true)
		objectPlayAnimation('fire', 'fire')
		setProperty('fire.antialiasing', false)
		scaleObject('fire', 4.7, 4.7)
		addLuaSprite('fire', true)
		setProperty('fire.visible', false)

		makeAnimatedLuaSprite('fireending', 'fireending', 0, 350)
		addAnimationByPrefix('fireending', 'fireending', 'fireending', 10, true)
		objectPlayAnimation('fireending', 'fireending')
		setProperty('fireending.antialiasing', false)
		scaleObject('fireending', 4.7, 4.7)
		addLuaSprite('fireending', true)
		setProperty('fireending.visible', false)	

	makeLuaSprite('border2','',-200,-80)
	makeGraphic('border2',200,4000,'000000')
	setScrollFactor('border2', 0, 0)

	makeAnimatedLuaSprite('bganimatedalt', 'bganimatedalt', 0, -350)
	addAnimationByPrefix('bganimatedalt', 'bganimatedalt', 'bganimatedalt', 8, true)
	objectPlayAnimation('bganimatedalt', 'bganimatedalt')
	setProperty('bganimatedalt.antialiasing', false)
	scaleObject('bganimatedalt', 4, 4)
	setObjectOrder('bganimatedalt', getObjectOrder('dadGroup')-2)
	addLuaSprite('bganimatedalt', true)
	setProperty('bganimatedalt.visible', false)


	makeAnimatedLuaSprite('fgalt', 'fgalt', 0, 40)
	addAnimationByPrefix('fgalt', 'fgalt', 'fgalt', 8, true)
	objectPlayAnimation('fgalt', 'fgalt')
	setProperty('fgalt.antialiasing', false)
	scaleObject('fgalt', 4, 4)
	setObjectOrder('fgalt', getObjectOrder('dadGroup')-1)
	addLuaSprite('fgalt', true)
	setProperty('fgalt.visible', false)
	
	makeLuaSprite('hello', 'hello', 190, 53)
	setProperty('hello.antialiasing', false)
	setObjectCamera('hello', 'other')
	scaleObject('hello', 0.72, 0.72)
	addLuaSprite('hello')
	setProperty('hello.visible', false)	



	makeAnimatedLuaSprite('loop', 'loop', -3200*4, 0)
	addAnimationByPrefix('loop', 'loop', 'loop', 14, true)
	objectPlayAnimation('loop', 'loop')
	setProperty('loop.antialiasing', false)
	scaleObject('loop', 4, 4)
	setObjectOrder('loop', getObjectOrder('dadGroup')-2)
	addLuaSprite('loop', true)
	setProperty('loop.visible', false)

	makeLuaSprite('goal', 'bgfront', 0, -390)
	setProperty('goal.antialiasing', false)
	scaleObject('goal', 4, 4)
	updateHitbox('goal')
	addLuaSprite('goal')
	setProperty('goal.visible', true)

	makeAnimatedLuaSprite('loopAI', 'loopAI', -3200*4, 0)
	addAnimationByPrefix('loopAI', 'loopAI', 'loopAI', 14, true)
	objectPlayAnimation('loopAI', 'loopAI')
	setProperty('loopAI.antialiasing', false)
	scaleObject('loopAI', 4, 4)
	setObjectOrder('loopAI', getObjectOrder('dadGroup')-2)
	addLuaSprite('loopAI', true)
	setProperty('loopAI.visible', false)



	makeAnimatedLuaSprite('loopingfg', 'loopingfg', -3200*4, 0)
	addAnimationByPrefix('loopingfg', 'loop', 'loop', 14, true)
	objectPlayAnimation('loop', 'loop')
	setProperty('loop.antialiasing', false)
	scaleObject('loop', 4, 4)
	setObjectOrder('loop', getObjectOrder('dadGroup')-2)
	addLuaSprite('loop', true)
	setProperty('loop.visible', false)

	
	makeLuaSprite('flagpole', 'pcport/flagpole', -2119 *6, 0)
	setProperty('flagpole.antialiasing', false)
	scaleObject('flagpole', 6, 6)
	updateHitbox('flagpole')
	addLuaSprite('flagpole')
	setObjectOrder('flagpole', getObjectOrder('dadGroup')+1)
	setProperty('flagpole.visible', true)
	
	makeLuaSprite('empty', 'pcport/empty', -2119 *6, 0)
	setProperty('empty.antialiasing', false)
	scaleObject('empty', 6, 6)
	updateHitbox('empty')
	addLuaSprite('empty')
	setProperty('empty.visible', false)
	

	makeLuaSprite('border1','',960,0)
	makeGraphic('border1',500,4000,'000000')
	setScrollFactor('border1', 0, 0)

	makeLuaSprite('welcomeblack', 'welcomeblack', -80, -60)
	setProperty('welcomeblack.antialiasing', false)
	scaleObject('welcomeblack', 0.9, 0.9)
	addLuaSprite('welcomeblack')
	setObjectOrder('welcomeblack', getObjectOrder('dadGroup')+9)
	setProperty('welcomeblack.visible', false)

	makeLuaSprite('blackscreen', 'welcomeblack', -80, -60)
	setProperty('blackscreen.antialiasing', false)
	scaleObject('blackscreen', 0.9, 0.9)
	addLuaSprite('blackscreen')
	setObjectOrder('blackscreen', getObjectOrder('dadGroup')+10)
	setProperty('blackscreen.visible', false)


	makeLuaSprite('welcome', 'welcome', -80, -60)
	setProperty('welcome.antialiasing', false)
	scaleObject('welcome', 0.9, 0.9)
	addLuaSprite('welcome')
	setObjectOrder('welcome', getObjectOrder('dadGroup')+11)
	setProperty('welcome.visible', false)


makeAnimatedLuaSprite('welcomeback', 'welcomeback', -80, -60)
addAnimationByPrefix('welcomeback', 'welcomeback', 'welcomeback', 30,true)
setProperty('welcomeback.antialiasing', false)
scaleObject('welcomeback', 0.9, 0.9)
addLuaSprite('welcomeback',false)
objectPlayAnimation('welcomeback','welcomeback',false)
setObjectOrder('welcomeback', getObjectOrder('dadGroup')+12)
setProperty('welcomeback.visible', false)


	makeLuaSprite('you', 'you', -80, -60)
	setProperty('you.antialiasing', false)
	scaleObject('you', 0.9, 0.9)
	addLuaSprite('you')
	setObjectOrder('you', getObjectOrder('dadGroup')+30)
	setProperty('you.visible', false)

	makeLuaSprite('cant', 'cant', -80, -60)
	setProperty('cant.antialiasing', false)
	scaleObject('cant', 0.9, 0.9)
	addLuaSprite('cant')
	setObjectOrder('cant', getObjectOrder('dadGroup')+31)
	setProperty('cant.visible', false)

	makeLuaSprite('run', 'run', -80, -60)
	setProperty('run.antialiasing', false)
	scaleObject('run', 0.9, 0.9)
	addLuaSprite('run')
	setObjectOrder('run', getObjectOrder('dadGroup')+32)
	setProperty('run.visible', false)


	makeLuaSprite('tails', 'tails', -80, -60)
	setProperty('tails.antialiasing', false)
	scaleObject('tails', 0.9, 0.9)
	addLuaSprite('tails')
	setObjectOrder('tails', getObjectOrder('dadGroup')+11)
	setProperty('tails.visible', false)


	makeLuaSprite('rings','rings',174, 630)
	setScrollFactor('rings', 0, 0)
	setObjectCamera('rings', 'hud')
	setProperty('rings.antialiasing', false)
	scaleObject('rings', 3.4, 3.4)
	addLuaSprite('rings',false)
	setProperty('rings.visible', false)

	makeLuaSprite('rings2','rings2',174, 630)
	setScrollFactor('rings2', 0, 0)
	setObjectCamera('rings2', 'hud')
	setProperty('rings2.antialiasing', false)
	scaleObject('rings2', 3.4, 3.4)
	addLuaSprite('rings2',false)
	setProperty('rings2.visible', true)
	
	makeAnimatedLuaSprite('ringsanimated', 'ringsanimated', 1, 518)
	setScrollFactor('ringsanimated', 0, 0)
	addAnimationByPrefix('ringsanimated', 'ringsanimated', 'ringsanimated', 4, true)
	objectPlayAnimation('ringsanimated', 'ringsanimated')
	setProperty('ringsanimated.antialiasing', false)
	scaleObject('ringsanimated', 3.4, 3.4)
	addLuaSprite('ringsanimated', true)
	setProperty('ringsanimated.visible', false)

	makeAnimatedLuaSprite('bgendAIblue', 'bgendAIblue', 0, -30)
	addAnimationByPrefix('bgendAIblue', 'bgendAIblue', 'bgendAIblue', 10, true)
	setProperty('bgendAIblue.antialiasing', false)
	scaleObject('bgendAIblue', 4.3, 4.3)
	addLuaSprite('bgendAIblue', false)
	setProperty('bgendAIblue.visible', false)
	objectPlayAnimation('bgendAIblue', 'bgendAIblue')

	makeLuaSprite('bgendblue', 'bgendblue', 0, -30)
	setProperty('bgendblue.antialiasing', false)
	scaleObject('bgendblue', 4.3, 4.3)
	addLuaSprite('bgendblue')
	setProperty('bgendblue.visible', false)
	

	---/////OBJECTS MAKING////---
		makeAnimatedLuaSprite('pipe1', 'pcport/pipebreak', 20, 40*4)
		addAnimationByIndices('pipe1', 'idle', 'pipebreak', '0, 0', 35)
		addAnimationByPrefix('pipe1', 'break', 'pipebreak', 70, false)
		scaleObject('pipe1', 4, 4)
		setProperty('pipe1.antialiasing', false)
		addLuaSprite('pipe1')
		setProperty('pipe1.visible', false)

		
		breakableObjects[1] = getProperty('pipe1')
		
		makeAnimatedLuaSprite('pipe2', 'pcport/pipebreak', 0, 33*6)
		addAnimationByIndices('pipe2', 'idle', 'pipebreak', '0, 0', 35)
		addAnimationByPrefix('pipe2', 'break', 'pipebreak', 70, false)
		setProperty('pipe2.antialiasing', false)
		addLuaSprite('pipe2')
		setProperty('pipe2.visible', false)
		
		breakableObjects[12] = getProperty('pipe2')
		
		makeAnimatedLuaSprite('solidB1', 'pcport/brickbreak', 0, 33*6)
		addAnimationByIndices('solidB1', 'idle', 'brickbreak', '0, 0', 35)
		addAnimationByPrefix('solidB1', 'break', 'brickbreak', 70, false)
		setProperty('solidB1.antialiasing', false)
		addLuaSprite('solidB1')
		setProperty('solidB1.visible', false)
		
		breakableObjects[2] = getProperty('solidB1')
		
		makeAnimatedLuaSprite('solidB2', 'pcport/brickbreak', 0, 33*6)
		addAnimationByIndices('solidB2', 'idle', 'brickbreak', '0, 0', 35)
		addAnimationByPrefix('solidB2', 'break', 'brickbreak', 70, false)
		setProperty('solidB2.antialiasing', false)
		addLuaSprite('solidB2')
		setProperty('solidB2.visible', false)
		
		breakableObjects[3] = getProperty('solidB2')
		
		makeAnimatedLuaSprite('solidB3', 'pcport/brickbreak', 0, 17*6)
		addAnimationByIndices('solidB3', 'idle', 'brickbreak', '0, 0', 35)
		addAnimationByPrefix('solidB3', 'break', 'brickbreak', 70, false)
		setProperty('solidB3.antialiasing', false)
		addLuaSprite('solidB3')
		setProperty('solidB3.visible', false)
		
		breakableObjects[4] = getProperty('solidB3')
		
		makeAnimatedLuaSprite('solidB4', 'pcport/brickbreak', 0, 33*6)
		addAnimationByIndices('solidB4', 'idle', 'brickbreak', '0, 0', 35)
		addAnimationByPrefix('solidB4', 'break', 'brickbreak', 70, false)
		setProperty('solidB4.antialiasing', false)
		addLuaSprite('solidB4')
		setProperty('solidB4.visible', false)
		
		breakableObjects[5] = getProperty('solidB4')
		
		makeAnimatedLuaSprite('solidB5', 'pcport/brickbreak', 0, 33*6)
		addAnimationByIndices('solidB5', 'idle', 'brickbreak', '0, 0', 35)
		addAnimationByPrefix('solidB5', 'break', 'brickbreak', 70, false)
		setProperty('solidB5.antialiasing', false)
		addLuaSprite('solidB5')
		setProperty('solidB5.visible', false)
		
		breakableObjects[6] = getProperty('solidB5')
		
		makeAnimatedLuaSprite('solidB6', 'pcport/brickbreak', 0, 17*6)
		addAnimationByIndices('solidB6', 'idle', 'brickbreak', '0, 0', 35)
		addAnimationByPrefix('solidB6', 'break', 'brickbreak', 70, false)
		setProperty('solidB6.antialiasing', false)
		addLuaSprite('solidB6')
		setProperty('solidB6.visible', false)
		
		breakableObjects[7] = getProperty('solidB6')
		
		makeAnimatedLuaSprite('emptyB1', 'pcport/emptybreak', 0, -20*6)
		addAnimationByIndices('emptyB1', 'idle', 'emptybreak', '0, 0', 35)
		addAnimationByPrefix('emptyB1', 'break', 'emptybreak', 70, false)
		setProperty('emptyB1.antialiasing', false)
		addLuaSprite('emptyB1')
		setProperty('emptyB1.visible', false)
		
		breakableObjects[8] = getProperty('emptyB1')
		
		makeAnimatedLuaSprite('emptyB2', 'pcport/emptybreak', 0, -20*6)
		addAnimationByIndices('emptyB2', 'idle', 'emptybreak', '0, 0', 35)
		addAnimationByPrefix('emptyB2', 'break', 'emptybreak', 70, false)
		setProperty('emptyB2.antialiasing', false)
		addLuaSprite('emptyB2')
		setProperty('emptyB2.visible', false)
		
		breakableObjects[9] = getProperty('emptyB2')
		
		makeAnimatedLuaSprite('emptyB3', 'pcport/emptybreak', 0, -20*6)
		addAnimationByIndices('emptyB3', 'idle', 'emptybreak', '0, 0', 35)
		addAnimationByPrefix('emptyB3', 'break', 'emptybreak', 70, false)
		setProperty('emptyB3.antialiasing', false)
		addLuaSprite('emptyB3')
		setProperty('emptyB3.visible', false)
		
		breakableObjects[10] = getProperty('emptyB3')
		
		makeAnimatedLuaSprite('emptyB4', 'pcport/emptybreak', 0, -16*6)
		addAnimationByIndices('emptyB4', 'idle', 'emptybreak', '0, 0', 35)
		addAnimationByPrefix('emptyB4', 'break', 'emptybreak', 70, false)
		setProperty('emptyB4.antialiasing', false)
		addLuaSprite('emptyB4')
		setProperty('emptyB4.visible', false)
		
		breakableObjects[11] = getProperty('emptyB4')
		
		makeAnimatedLuaSprite('emptyB5', 'pcport/emptybreak', 0, -20*6)
		addAnimationByIndices('emptyB5', 'idle', 'emptybreak', '0, 0', 35)
		addAnimationByPrefix('emptyB5', 'break', 'emptybreak', 70, false)
		setProperty('emptyB5.antialiasing', false)
		addLuaSprite('emptyB5')
		setProperty('emptyB5.visible', false)
		
		breakableObjects[13] = getProperty('emptyB5')
		
		makeAnimatedLuaSprite('emptyB6', 'pcport/emptybreak', 0, -20*6)
		addAnimationByIndices('emptyB6', 'idle', 'emptybreak', '0, 0', 35)
		addAnimationByPrefix('emptyB6', 'break', 'emptybreak', 70, false)
		setProperty('emptyB6.antialiasing', false)
		addLuaSprite('emptyB6')
		setProperty('emptyB6.visible', false)
		
		breakableObjects[14] = getProperty('emptyB6')
		
		makeAnimatedLuaSprite('emptyB7', 'pcport/emptybreak', 0, -20*6)
		addAnimationByIndices('emptyB7', 'idle', 'emptybreak', '0, 0', 35)
		addAnimationByPrefix('emptyB7', 'break', 'emptybreak', 70, false)
		setProperty('emptyB7.antialiasing', false)
		addLuaSprite('emptyB7')
		setProperty('emptyB7.visible', false)
		
		breakableObjects[15] = getProperty('emptyB7')
		
		makeAnimatedLuaSprite('solidB7', 'pcport/brickbreak', 0, 33*6)
		addAnimationByIndices('solidB7', 'idle', 'brickbreak', '0, 0', 35)
		addAnimationByPrefix('solidB7', 'break', 'brickbreak', 70, false)
		setProperty('solidB7.antialiasing', false)
		addLuaSprite('solidB7')
		setProperty('solidB7.visible', false)
		
		breakableObjects[16] = getProperty('solidB7')
		
		makeAnimatedLuaSprite('solidB8', 'pcport/brickbreak', 0, 33*6)
		addAnimationByIndices('solidB8', 'idle', 'brickbreak', '0, 0', 35)
		addAnimationByPrefix('solidB8', 'break', 'brickbreak', 70, false)
		setProperty('solidB8.antialiasing', false)
		addLuaSprite('solidB8')
		setProperty('solidB8.visible', false)
		
		breakableObjects[17] = getProperty('solidB8')
		
		makeAnimatedLuaSprite('solidB9', 'pcport/brickbreak', 0, 17*6)
		addAnimationByIndices('solidB9', 'idle', 'brickbreak', '0, 0', 35)
		addAnimationByPrefix('solidB9', 'break', 'brickbreak', 70, false)
		setProperty('solidB9.antialiasing', false)
		addLuaSprite('solidB9')
		setProperty('solidB9.visible', false)
		
		breakableObjects[18] = getProperty('solidB9')
		
		makeAnimatedLuaSprite('solidB10', 'pcport/brickbreak', 0, 17*6)
		addAnimationByIndices('solidB10', 'idle', 'brickbreak', '0, 0', 35)
		addAnimationByPrefix('solidB10', 'break', 'brickbreak', 70, false)
		setProperty('solidB10.antialiasing', false)
		addLuaSprite('solidB10')
		setProperty('solidB10.visible', false)
		
		breakableObjects[19] = getProperty('solidB10')
		
		makeAnimatedLuaSprite('solidB11', 'pcport/brickbreak', 0, 33*6)
		addAnimationByIndices('solidB11', 'idle', 'brickbreak', '0, 0', 35)
		addAnimationByPrefix('solidB11', 'break', 'brickbreak', 70, false)
		setProperty('solidB11.antialiasing', false)
		addLuaSprite('solidB11')
		setProperty('solidB11.visible', false)
		
		breakableObjects[20] = getProperty('solidB11')
		
		makeAnimatedLuaSprite('solidB12', 'pcport/brickbreak', 0, 33*6)
		addAnimationByIndices('solidB12', 'idle', 'brickbreak', '0, 0', 35)
		addAnimationByPrefix('solidB12', 'break', 'brickbreak', 70, false)
		setProperty('solidB12.antialiasing', false)
		addLuaSprite('solidB12')
		setProperty('solidB12.visible', false)
		
		breakableObjects[21] = getProperty('solidB12')
		
	--//////OBJECTS END////----
	makeAnimatedLuaSprite('brickscroll', 'brickscroll', -3417*4, -192)
	addAnimationByPrefix('brickscroll', 'brickscroll', 'brickscroll', 14, true)
	objectPlayAnimation('brickscroll', 'brickscroll')
	setProperty('brickscroll.antialiasing', false)
	updateHitbox('brickscroll')
	scaleObject('brickscroll', 4, 4)
	addLuaSprite('brickscroll', true)
	setProperty('brickscroll.visible', true)



	
	makeLuaSprite('pipeEnd', 'pcport/endpipe', 0, 0)
	setProperty('pipeEnd.antialiasing', false)
	scaleObject('pipeEnd', 6, 6)
	updateHitbox('pipeEnd')
	addLuaSprite('pipeEnd', true)
	setProperty('pipeEnd.visible', false)
	
	addLuaSprite('border1',true)
	addLuaSprite('border2',true)
	
	makeLuaSprite('ringbg', 'ringbg', -110, -100)
	setProperty('ringbg.antialiasing', false)
	scaleObject('ringbg', 4, 4)
	setObjectOrder('ringbg', getObjectOrder('dadGroup')-10)
	addLuaSprite('ringbg')
	setProperty('ringbg.visible', false)

	makeLuaSprite('hiddenWall', 'bfplatform', 220, 440)
	setProperty('hiddenWall.antialiasing', false)
	scaleObject('hiddenWall', 4, 4)
	updateHitbox('hiddenWall')
	addLuaSprite('hiddenWall')
	setProperty('hiddenWall.visible', false)

	makeAnimatedLuaSprite('mxLegs', 'pcport/legs', 70*6, 8.95*6)
	addAnimationByPrefix('mxLegs', 'idle', 'legs', 48, true)
	addAnimationByPrefix('mxLegs', 'idle-mad', 'runmad', 40, true)
	addAnimationByPrefix('mxLegs', 'jump', 'legjump', 30, true)
	setProperty('mxLegs.antialiasing', false)
	addLuaSprite('mxLegs')
	setProperty('mxLegs.visible', false)
	
	makeAnimatedLuaSprite('bfLegs', 'pcport/bflegs', 70*6, 80*1.1)
	addAnimationByPrefix('bfLegs', 'idle', 'run0', 11, true)
	addAnimationByPrefix('bfLegs', 'jump', 'jump0', 11, true)
	addAnimationByPrefix('bfLegs', 'idle-fire', 'runfire0', 11, true)
	addAnimationByPrefix('bfLegs', 'jump-fire', 'jumpfire0', 11, true)
	addAnimationByPrefix('bfLegs', 'idle-small', 'runsmall0', 11, true)
	addAnimationByPrefix('bfLegs', 'jump-small', 'jumpsmall0', 11, true)
	scaleObject('bfLegs', 4.8, 4.8)
	setObjectOrder('bfLegs', getObjectOrder('dadGroup')-0.5)
	setProperty('bfLegs.antialiasing', false)
	addLuaSprite('bfLegs')
	setProperty('bfLegs.visible', false)




	makeLuaSprite('one', '1', 70.95*6, 28.5*6)
	setProperty('one.antialiasing', false)
	scaleObject('one', 6, 6)
	updateHitbox('one')
	addLuaSprite('one', true)
	setProperty('one.visible', false)
	
	makeLuaSprite('two', '2', 70.95*6, 28.5*6)
	setProperty('two.antialiasing', false)
	scaleObject('two', 6, 6)
	updateHitbox('two')
	addLuaSprite('two', true)
	setProperty('two.visible', false)
	
	makeLuaSprite('three', '3', 71.95*6, 28.5*6)
	setProperty('three.antialiasing', false)
	scaleObject('three', 6, 6)
	updateHitbox('three')
	addLuaSprite('three', true)
	setProperty('three.visible', false)
	
	makeLuaSprite('go', 'start', 61.95*6, 24.45*6)
	setProperty('go.antialiasing', false)
	scaleObject('go', 6, 6)
	updateHitbox('go')
	addLuaSprite('go', true)
	setProperty('go.visible', false)
	
	setProperty('dad.x', 110*6)
	setProperty('dad.y', 22*6)
	
	makeLuaSprite('mxPoint', 'pcport/legs', 74*6, 8.95*6)
	makeLuaSprite('bfPoint', 'pcport/legs', 74*6, 8.95*6)
end

function onGameOverStart()
	-- You died! Called every single frame your health is lower (or equal to) zero
	--return Function_Stop
	--setScrollFactor(getPropertyFromClass('GameOverSubstate', 'boyfriend'), 0, 0)
	setPropertyFromClass('flixel.FlxG', 'camera.x', 0)
	setPropertyFromClass('flixel.FlxG', 'camera.y', 0)
	setProperty('boyfriend.x', 580)
	setProperty('boyfriend.y', 385)
	objectPlayAnimation('boyfriend', 'die', true)
	return Function_Continue;
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'powerup' and not isSustainNote then
		if powerup < 2 then
			if getPropertyFromGroup('notes', id, 'texture') == 'mushroom' then
				powerup = 1
			else
				powerup = 2
			end
			powerupSpawned = false
			powerupVisuals(getProperty('boyfriend.animation.name'), getProperty('boyfriend.animation.curAnim.curFrame'))
			playSound('powerup')
		end
	end
end

function opponentNoteHit(id, noteData, noteType, isSustainNote)
	if getProperty('dad.curCharacter') == 'big-mx' and flashingLights then
		--triggerEvent('Pixel Cam Shake', '3, 2, 2', '0.025')
	end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if dmgCooldown <= 0 then
		dmgCooldown = 2.5
		powerup = powerup - 1
		playSound('power_down')
		if powerup < 0 then
			setProperty('health', 0)
		else
			powerupVisuals(getProperty('boyfriend.animation.name'), getProperty('boyfriend.animation.curAnim.curFrame'))
		end
	end
end

function powerupVisuals(curAnim, curFrame)
	prefix = bfPrefix
	stopFlicker = true
	if powerup == 2 then
		triggerEvent('Change Character', 'bf', prefix..'-fire')
		bfLegsPrefix = '-fire'
		timeUntilPowerup = -1
		setProperty('rings2.visible', true)
		setProperty('rings.visible', false)
		setProperty('ringsanimated.visible', false)
	elseif powerup == 1 then
		timeUntilPowerup = 12
		triggerEvent('Change Character', 'bf', prefix)
		bfLegsPrefix = ''
		setProperty('rings2.visible', false)
		setProperty('rings.visible', true)
		setProperty('ringsanimated.visible', false)
	elseif powerup == 0 then
		timeUntilPowerup = 5
		triggerEvent('Change Character', 'bf', prefix..'-small')
		bfLegsPrefix = '-small'
		setProperty('rings2.visible', false)
		setProperty('rings.visible', false)
		setProperty('ringsanimated.visible', true)
	end
	legsAnim = getProperty('bfLegs.animation.curAnim.name')
	animToPlay = ''
	if legsAnim == 'jump' or legsAnim == 'jump-fire' or legsAnim == 'jump-small' then
		animToPlay = 'jump'
	else 
		animToPlay = 'idle'
	end
	objectPlayAnimation('bfLegs', animToPlay..bfLegsPrefix, true)
	stopFlicker = false
	
	if prefix == 'bf-chase' then
		setProperty('boyfriend.x', 37*6)
		setProperty('boyfriend.y', 28*6)
	elseif prefix == 'bf-wall' then
		setProperty('boyfriend.x', 410)
		setProperty('boyfriend.y', 360)
	end
	
	characterPlayAnim('boyfriend', curAnim, true)
	setProperty('boyfriend.animation.curAnim.curFrame', curFrame)
end


math.round = function(num)
    return math.floor(num + 0.5)
end

startTrigger = false
triggered = false
stopFlicker = false

starColor = 0

trigger = false
deathTrigger = false

powerupSpawned = false
pressedEnter = false
set = false

function onUpdate(elapsed)
	setProperty('camZooming', false)
	
	if powerup >= 0 then
		setProperty('health', 1)
	end
	
	if timeUntilPowerup > 0 then
		timeUntilPowerup = timeUntilPowerup - elapsed
		--debugPrint(timeUntilPowerup)
	elseif timeUntilPowerup <= 0 then
		if powerup < 2 and not powerupSpawned then
			if getPropertyFromGroup('unspawnNotes', 0, 'noteType') == '' and getPropertyFromGroup('unspawnNotes', 0, 'mustPress') and getPropertyFromGroup('unspawnNotes', 0, 'isSustainNote') == false then
				--debugPrint('powerup spawn')
				powerupSpawned = true
				setPropertyFromGroup('unspawnNotes', 0, 'noteType', 'powerup')
				if powerup == 0 then
					setPropertyFromGroup('unspawnNotes', 0, 'texture', 'mushroom')
				elseif powerup == 1 then 
					setPropertyFromGroup('unspawnNotes', 0, 'texture', 'flower')
				end
			end
		end
	end
	
	if dmgCooldown > 0 then
		setProperty('boyfriend.alpha', (getPropertyFromClass('flixel.FlxG', 'game.ticks') % 2))
		setProperty('bfLegs.alpha', (getPropertyFromClass('flixel.FlxG', 'game.ticks') % 2))
		dmgCooldown = dmgCooldown - elapsed
		if dmgCooldown <= 0 then
			dmgCooldown = 0
			setProperty('boyfriend.alpha', 1)
			setProperty('bfLegs.alpha', 1)
		end
	end
	
	
	--cahse shit
	if isChase then
		if startTrigger == false then
			startTrigger = true
			removeLuaSprite('goal')
			setProperty('flagpole.visible', true)
			setProperty('loop.visible', true)
			setProperty('loopAI.visible', false)
			setProperty('mxLegs.visible', false)
			chaseBGX = getProperty('loop.x')
			
			setProperty('mxPoint.y', getProperty('mxLegs.y'))
			mxLegsHighY = getProperty('mxLegs.y') - (40*6)
			mxLegsDefY = getProperty('mxLegs.y')
			
			setProperty('bfPoint.y', getProperty('bfLegs.y'))
			bfLegsHighY = getProperty('bfLegs.y') - (40*6)
			bfLegsDefY = getProperty('bfLegs.y')
			
			for i,object in pairs(breakableObjects) do
				setProperty(object..'.visible', true)
			end
		end
		
		--legs shit
		if getProperty('dad.idleSuffix') ~= '-j' then
			if getProperty('dad.animation.curAnim.name') == 'idle' and getProperty('mxLegs.visible') ~= false then
				setProperty('mxLegs.visible', false)
			elseif getProperty('dad.animation.curAnim.name') ~= 'idle' and getProperty('mxLegs.visible') ~= true then
				setProperty('mxLegs.visible', true)
			end
		elseif getProperty('mxLegs.visible') ~= true then
			setProperty('mxLegs.visible', true)
		end
		
		if getProperty('boyfriend.idleSuffix') ~= '-j' then
			if getProperty('boyfriend.animation.curAnim.name') == 'idle' and getProperty('bfLegs.visible') ~= false then
				setProperty('bfLegs.visible', false)
			elseif getProperty('boyfriend.animation.curAnim.name') ~= 'idle' and getProperty('bfLegs.visible') ~= true then
				setProperty('bfLegs.visible', true)
			end
		elseif getProperty('bfLegs.visible') ~= true then
			setProperty('bfLegs.visible', true)
		end
		
		--bg shit

		chaseBGX = chaseBGX + 1640 * elapsed
		
		if chaseBGX >= 0 then
			if getProperty('brickscroll.visible') == false then
				setProperty('brickscroll.visible', true)
			end
			if getProperty('brickscrollAI.visible') == false then
				if curStep >= 2047 then
					setProperty('brickscrollAI.visible', true)

				end
			end
			removeLuaSprite('flagpole')
			chaseBGX = -2119 *6
			for i=1, #jumpTriggers do --wanted to do a different for loop but it wouldnt work :v
				jumpTriggers[i] = false
			end
			
			for i,object in pairs(breakableObjects) do
				if not pipeEnd then
					objectPlayAnimation(object, 'idle', true)
				end
			end
		end
		setProperty('loop.x', math.round(chaseBGX/6)*6)
		setProperty('loopAI.x', math.round(chaseBGX/6)*6)
		setProperty('brickscroll.x', getProperty('loop.x'))
		setProperty('pipeEnd.x', getProperty('loop.x'))
		setProperty('empty.x', getProperty('loop.x'))
		if getProperty('flagpole') ~= nil then
			setProperty('flagpole.x', getProperty('loop.x'))
		end
		--debugPrint(getProperty('loop.x'))

		if not PipeEnd then
			--bf shit
			for i=-2119*6, -2075*6 do
				if getProperty('loop.x') == i and not jumpTriggers[3] then
					jumpTriggers[3] = true
					doTweenY('jumpBF', 'bfPoint', bfLegsHighY+(2*6), 0.45, 'sineOut')
					objectPlayAnimation('bfLegs', 'jump'..bfLegsPrefix, true)
					setProperty('boyfriend.idleSuffix', '-j')
					if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
						characterPlayAnim('boyfriend', 'idle-j', true)
					end
				end
			end
			
			
			for i=-1390*6, -1341*6 do
				if getProperty('loop.x') == i and not jumpTriggers[5] then
					jumpTriggers[5] = true
					doTweenY('jumpBF', 'bfPoint', bfLegsHighY+(10*6), 0.45, 'sineOut')
					objectPlayAnimation('bfLegs', 'jump'..bfLegsPrefix, true)
					setProperty('boyfriend.idleSuffix', '-j')
					if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
						characterPlayAnim('boyfriend', 'idle-j', true)
					end
				end
			end
			
			for i=-620*6, -600*6 do
				if getProperty('loop.x') == i and not jumpTriggers[8] then
					jumpTriggers[8] = true
					doTweenY('jumpBFF', 'bfPoint', bfLegsHighY+(15*6), 0.3, 'sineOut')
					objectPlayAnimation('bfLegs', 'jump'..bfLegsPrefix, true)
					setProperty('boyfriend.idleSuffix', '-j')
					if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
						characterPlayAnim('boyfriend', 'idle-j', true)
					end
				end
			end
			
			
		end
		
		setProperty('boyfriend.y', math.round(getProperty('bfPoint.y')/6)*6+(1*6))
		setProperty('bfLegs.y', getProperty('boyfriend.y')-(1*6))
		
		setProperty('dad.y', math.round(getProperty('mxPoint.y')/6)*6)
		setProperty('mxLegs.y', getProperty('dad.y'))
		
		--objects shit
		for i,object in pairs(breakableObjects) do
			local offset = 0
			
			if i == 1 then --pipe 1
				offset = 2010
			elseif i == 2 then
				offset = 2088
			elseif i == 3 or i == 4 then
				offset = 2072
			elseif i == 5 then
				offset = 1992
			elseif i == 6 or i == 7 then
				offset = 2008
			elseif i == 8 then
				offset = 1400
			elseif i == 9 then
				offset = 1369
			elseif i == 10 then
				offset = 1336
			elseif i == 11 then
				offset = 1768
			elseif i == 12 then --pipe 2
				offset = 870
			elseif i == 13 then
				offset = 602
			elseif i == 14 then
				offset = 571
			elseif i == 15 then
				offset = 540
			elseif i == 16 then
				offset = 426
			elseif i == 17 or i == 18 then
				offset = 410
			elseif i == 19 or i == 20 then
				offset = 345
			elseif i == 21 then
				offset = 329
			end
			
			hitboxOfs = 0
			
			if i == 1 or i == 12 then
				hitboxOfs = 52
			else
				hitboxOfs = 20
			end
			
			setProperty(object..'.x', getProperty('loop.x') + (offset * 6))
			
			if getProperty(object..'.x') >= (getProperty('dad.x') - (hitboxOfs * 6)) and not pipeEnd then
			
				if getProperty(object..'.animation.curAnim.name') ~= 'break' then
					objectPlayAnimation(object, 'break', true)
				end
				
			end
		end
	elseif pipeEnd and getProperty('boyfriend.animation.curAnim.name') ~= 'pause' then
		characterPlayAnim('boyfriend', 'pause', true)
		characterPlayAnim('dad', 'pause', true)
	end	


	if not middlescroll then
		if curBeat == 0 then
			setPropertyFromGroup('playerStrums', 0, 'x', defaultOpponentStrumX0+80)

			setPropertyFromGroup('playerStrums', 1, 'x', defaultOpponentStrumX1+80)

			setPropertyFromGroup('playerStrums', 2, 'x', defaultOpponentStrumX2+80)

			setPropertyFromGroup('playerStrums', 3, 'x', defaultOpponentStrumX3+80)


			setPropertyFromGroup('opponentStrums', 0, 'x', defaultPlayerStrumX0 - 60)

			setPropertyFromGroup('opponentStrums', 1, 'x', defaultPlayerStrumX1 - 60)

			setPropertyFromGroup('opponentStrums', 2, 'x', defaultPlayerStrumX2 - 60)

			setPropertyFromGroup('opponentStrums', 3, 'x', defaultPlayerStrumX3 - 60)
			
			--y
			setPropertyFromGroup('playerStrums', 0, 'y', defaultOpponentStrumY0-30)

			setPropertyFromGroup('playerStrums', 1, 'y', defaultOpponentStrumY1-30)

			setPropertyFromGroup('playerStrums', 2, 'y', defaultOpponentStrumY2-30)

			setPropertyFromGroup('playerStrums', 3, 'y', defaultOpponentStrumY3-30)


			setPropertyFromGroup('opponentStrums', 0, 'y', defaultPlayerStrumY0 - 30)

			setPropertyFromGroup('opponentStrums', 1, 'y', defaultPlayerStrumY1 - 30)

			setPropertyFromGroup('opponentStrums', 2, 'y', defaultPlayerStrumY2 - 30)

			setPropertyFromGroup('opponentStrums', 3, 'y', defaultPlayerStrumY3 - 30)


		end
	end
end

function onTweenCompleted(tag)
	if tag == 'jumpMX' then
		doTweenY('fallMX', 'mxPoint', mxLegsDefY, 0.45, 'sineIn')
	end
	
	if tag == 'fallMX' then
		setProperty('dad.idleSuffix', '')
		objectPlayAnimation('mxLegs', 'idle'..legsSuffix, true)
		if getProperty('dad.animation.curAnim.name') == 'idle-j' then
			characterPlayAnim('dad', 'idle', true)
		end
	end
	
	if tag == 'jumpBF' then
		doTweenY('fallBF', 'bfPoint', bfLegsDefY, 0.4, 'sineIn')
	end
	
	if tag == 'jumpBFF' then
		doTweenY('fallBF', 'bfPoint', bfLegsDefY, 0.25, 'sineIn')
	end
	
	if tag == 'jumpBFs' then
		doTweenY('fallBF', 'bfPoint', bfLegsDefY, 0.5, 'sineIn')
	end
	
	if tag == 'fallBF' then
		setProperty('boyfriend.idleSuffix', '')
		objectPlayAnimation('bfLegs', 'idle'..bfLegsPrefix, true)
		if getProperty('boyfriend.animation.curAnim.name') == 'idle-j' then
			characterPlayAnim('boyfriend', 'idle', true)
		end
	end
end

function onMoveCamera(focus)
	setPropertyFromClass('flixel.FlxG.camera', 'target', nil)
	setProperty('camGame.zoom', 0.8)
	setProperty('camGame.x', 23*6)
	setProperty('camGame.y', 15*6)
	setProperty('camHUD.zoom', 0.8)
	setProperty('isCameraOnForcedPos', true)
	setProperty('camFollowPos.x', getPropertyFromClass('flixel.FlxG', 'width') / 2)
	setProperty('camFollowPos.y', getPropertyFromClass('flixel.FlxG', 'height') / 2)
	setProperty('camFollow.x', getPropertyFromClass('flixel.FlxG', 'width') / 2)
	setProperty('camFollow.y', getPropertyFromClass('flixel.FlxG', 'height') / 2)
end

starTrigger = false
curFrame = -1
function onEvent(n, v1, v2)
	if n == 'Powerup Visuals' and v1 == 'bf-chase' then
		stopFlicker = false
		bfPrefix = v1
		powerupVisuals(getProperty('boyfriend.animation.name'), getProperty('boyfriend.animation.curAnim.curFrame'))
		setProperty('boyfriend.x', 37*6)
		setProperty('boyfriend.y', 28*6)
		setProperty('bfLegs.x', 37*6)
		setProperty('bfLegs.y', 26*6)
	end

	if n == 'Powerup Visuals' and v1 == 'bf-wall' then
		stopFlicker = false
		bfPrefix = v1
		powerupVisuals(getProperty('boyfriend.animation.name'), getProperty('boyfriend.animation.curAnim.curFrame'))
		setProperty('boyfriend.x', 410)
		setProperty('boyfriend.y', 360)
		setProperty('camHUD.visible', true)
		removeLuaSprite('luigiDead')
	end
	
	if n == 'Change Character' and v2 == 'marionear' then
		setProperty('dad.y', 29*6)
	end
	
	if n == 'Change Character' and v2 == 'mx' then
		if not starTrigger then
			starTrigger = true
			stopFlicker = true
			cancelTween('starFlicker')
		end
		setProperty('dad.x', 78*6)
		setProperty('dad.y', 9.1*6)
		setProperty('mxLegs.x', getProperty('dad.x'))
		isChase = true
	end
	
	if n == 'Powerup Visuals' and v1 == 'bf-chase' then
		if isChase == false then
			isChase = true
			setProperty('camGame.visible', true)
		end
	end
	
	if n == 'Change Character' and v2 == 'mx-angry' then
		stopFlicker = true
		cancelTween('starFlicker')
		legsSuffix = '-mad'
		setProperty('dad.x', 78*6)
		setProperty('dad.y', 9*6)
		setProperty('mxLegs.y', getProperty('dad.y'))
		switchScene(false)
	end
	
	if n == 'Change Character' and v2 == 'mx-angry2' then
		setProperty('dad.x', 78*6)
		setProperty('dad.y', 9.05*6)
	end
	
	if n == 'Change Character' and v2 == 'big-mx' then
		stopFlicker = true
		cancelTween('starFlicker')
		isChase = false
		setProperty('dad.x', 400)
		setProperty('dad.y', 100)
		switchScene(true)
	end
	
	if n == 'end Pipe' then
		pipeEnd = true
		setProperty('pipeEnd.visible', true)
		setProperty('loop.visible', false)
		setProperty('empty.visible', true)
		for i,object in pairs(breakableObjects) do
			removeLuaSprite(object)
		end
		
		for i=1, #jumpTriggers do --wanted to do a different for loop but it wouldnt work :v
			jumpTriggers[i] = true
		end
	end
	
	if n == 'Enter Pipe' then
		isChase = false
		removeLuaSprite('mxLegs')
		removeLuaSprite('bfLegs')
		runTimer('goIntoPipe', 0.05, 30)
	end
	
	if n == 'Popup' then
		curFrame = curFrame + 1
		if curFrame < 5 then
			setProperty('popup.animation.curAnim.curFrame', curFrame)
			setProperty('popup.visible', true)
		else
			removeLuaSprite('popup')
		end
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'goIntoPipe' then
		setProperty('boyfriend.x', getProperty('boyfriend.x')-6)
	end

	
	if tag == 'countdown1' then
		setProperty('camGame.alpha', getProperty('camGame.alpha') + 1.25)
		removeLuaSprite('one')
		setProperty('two.visible', true)
		playSound('countdown')
		runTimer('countdown2', 0.63)
		setProperty('camGame.alpha', getProperty('camGame.alpha') + 1)
		allowCountdown = true
		startCountdown()
		for i=0, getProperty('opponentStrums.length')-1 do
			if not middlescroll then
				setPropertyFromGroup('opponentStrums', i, 'alpha', 1)
				setPropertyFromGroup('playerStrums', i, 'alpha', 1)
			else 
				setPropertyFromGroup('opponentStrums', i, 'visible', false)
				setPropertyFromGroup('playerStrums', i, 'alpha', 1)
			end
			setPropertyFromGroup('opponentStrums', i, 'texture', 'smbNotes')
			setPropertyFromGroup('playerStrums', i, 'texture', 'smbNotes')
		end
		for i=0, getProperty('strumLineNotes.length')-1 do
			if middlescroll and downscroll then
			setPropertyFromGroup('strumLineNotes', i, 'y', getPropertyFromGroup('strumLineNotes', i, 'y')+8*6)
			elseif not middlescroll and downscroll then
			setPropertyFromGroup('strumLineNotes', i, 'y', getPropertyFromGroup('strumLineNotes', i, 'y')+10*6)
			end
			
			if middlescroll and not downscroll then
				setPropertyFromGroup('strumLineNotes', i, 'y', getPropertyFromGroup('strumLineNotes', i, 'y')-4*6)
			end
		end
	end
	
	if tag == 'countdown2' then
		removeLuaSprite('two')
		setProperty('three.visible', true)
		playSound('countdown')
		runTimer('countdown3', 0.63)
		setProperty('camGame.alpha', getProperty('camGame.alpha') + 1.25)
	end
	
	if tag == 'countdown3' then
		removeLuaSprite('three')
		setProperty('go.visible', true)
		playSound('countdownEnd')
		runTimer('countdown4', 0.63)
		setProperty('camGame.alpha', getProperty('camGame.alpha') + 0.25)
	end
	
	if tag == 'countdown4' then
		removeLuaSprite('go')
	end
end

function switchScene(isWall)
	if isWall then
		isChase = false
		setObjectOrder('hiddenWall', getObjectOrder('dadGroup') + 1)
		setObjectOrder('boyfriendGroup', getObjectOrder('hiddenWall') + 2)
		setObjectOrder('dadGroup', getObjectOrder('dadGroup') + 1)
		
		for i,object in pairs(breakableObjects) do
			setProperty(object..'.visible', false)
		end
		
		setProperty('brickscroll.visible', false)
		setProperty('hiddenWall.visible', true)
		setProperty('ringbg.visible', true)
		setProperty('mxLegs.visible', false)
		setProperty('bfLegs.visible', false)
		setProperty('loop.visible', false)
	else
		removeLuaSprite('hiddenWall')
		removeLuaSprite('ringbg')
		
		
		for i=1, #jumpTriggers do --wanted to do a different for loop but it wouldnt work :v
				jumpTriggers[i] = false
			end
		
		startTrigger = false
		for i,object in pairs(breakableObjects) do
			objectPlayAnimation(object, 'idle', true)
		end
		setProperty('loop.x', -2119 * 6)
	end
end

