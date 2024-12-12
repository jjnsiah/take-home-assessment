from webapp.app import app
import pytest

@pytest.fixture
def client():
    """ A test client for the app """
    with app.test_client() as client:
        yield client

def test_home(client):
    """ Testing home endpoint """
    response = client.get('/')
    assert response.status_code == 200
    assert response.data.decode('utf-8') == "Hello, this is the Tickup Interview Assessment"


