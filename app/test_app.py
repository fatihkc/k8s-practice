import unittest
import json
from app import application, Storage

class TestApp(unittest.TestCase):

    def setUp(self):
        self.app = application.test_client()

    def test_hello_world(self):
        response = self.app.get('/')
        self.assertEqual(response.status_code, 200)
        self.assertTrue(b"Hello Devops 123" in response.data)

    def test_storage(self):
        storage = Storage()
        storage.populate()
        score = storage.score()
        self.assertEqual(score, 1234)

if __name__ == "__main__":
    unittest.main()
