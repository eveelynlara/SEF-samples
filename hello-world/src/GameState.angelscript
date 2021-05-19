class GameState : sef::BaseState
{
	sef::UILayer@ m_hudLayer;

	ETHEntity@ m_spaceShip;

	GameState()
	{
		super("empty", vector2(sef::getFixedHeight() / 2.0f) /*bucketSize*/);
		sef::state::backgroundColor = 0xFF000000;
	}

	void onCreated() override
	{
		BaseState::onCreated();

		// insert ui layer
		@m_hudLayer = sef::UILayer("HUD", false /*iterable*/);
		addLayer(@m_hudLayer);
		setCurrentLayer(m_hudLayer.getName());

		// add sample text element to hud layer
		sef::UIDrawableText textElement(
			vector2(0.5f, 0.053f) /*position*/,
			vector2(0.5f, 0.0f) /*origin*/,
			sef::StaticFont("Verdana24_shadow.fnt"),
			"Move the space ship around",
			2.5f /*scale*/, 
			true /*centered*/,
			sef::uieffects::createBounceAppearEffect(200, 1.1f, 500 /*delay*/, 15 /*repeats*/),
			false /*worldSpace*/,
			0x889CD92B /*ARGB*/);

		textElement.setName("instructions");

		m_hudLayer.insertElement(@textElement);

		// add space ship to scene
		AddEntity("space_ship.ent", vector3(GetScreenSize() / 2.0f, 0.0f), m_spaceShip);
	}

	void onUpdate() override
	{
		BaseState::onUpdate();

		ETHInput@ input = GetInputHandle();

		vector2 movementDir;

		if (input.KeyDown(K_LEFT))
		{
			movementDir.x -= 1.0f;
		}

		if (input.KeyDown(K_RIGHT))
		{
			movementDir.x += 1.0f;
		}

		if (input.KeyDown(K_UP))
		{
			movementDir.y -= 1.0f;
		}

		if (input.KeyDown(K_DOWN))
		{
			movementDir.y += 1.0f;
		}

		const float speed = sef::TimeManager.unitsPerSecond(400.0f);
		m_spaceShip.AddToPositionXY(normalize(movementDir) * speed);
	}
}
