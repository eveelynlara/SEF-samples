class CameraController : sef::GameController
{
	private sef::FollowerAsymptotic@ m_follower;

	CameraController()
	{
		@m_follower = sef::FollowerAsymptotic(GetCameraPos(), 0.015f, true /*dontPause*/);
	}

	void update() override
	{
		m_follower.update();
		SetCameraPos(m_follower.getPos());
	}

	void setDest(const vector2 &in dest)
	{
		m_follower.setDestinationPos(dest - (GetScreenSize() * 0.5f));
	}

	void draw() override {}
}
