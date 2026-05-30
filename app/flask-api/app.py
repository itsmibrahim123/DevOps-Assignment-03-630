from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
import os
import time

app = Flask(__name__)

# Database configuration
db_host = os.getenv('DB_HOST', 'mysql')
db_user = os.getenv('DB_USER', 'flaskuser')
db_password = os.getenv('DB_PASSWORD', 'flaskpass')
db_name = os.getenv('DB_NAME', 'flaskdb')

app.config['SQLALCHEMY_DATABASE_URI'] = f"mysql+mysqlconnector://{db_user}:{db_password}@{db_host}/{db_name}"
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)

class Item(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    description = db.Column(db.String(200))

    def to_dict(self):
        return {"id": self.id, "name": self.name, "description": self.description}

# Create tables if they don't exist
with app.app_context():
    # Wait for DB to be ready
    retries = 5
    while retries > 0:
        try:
            db.create_all()
            break
        except Exception as e:
            print(f"Waiting for database... {e}")
            time.sleep(5)
            retries -= 1

@app.route('/health')
def health():
    return jsonify({"service": "flask-api", "status": "healthy"})

@app.route('/api/items', methods=['GET'])
def get_items():
    items = Item.query.all()
    return jsonify([item.to_dict() for item in items])

@app.route('/api/items', methods=['POST'])
def create_item():
    data = request.json
    new_item = Item(name=data['name'], description=data.get('description', ''))
    db.session.add(new_item)
    db.session.commit()
    return jsonify(new_item.to_dict()), 201

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
