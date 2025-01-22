from flask import Flask, request, jsonify
import pymysql

app = Flask(__name__)

# Database connection
def get_db_connection():
    return pymysql.connect(
        host="your-rds-endpoint",
        user="admin",
        password="password123",
        database="bankingdb"
    )

@app.route('/process-payment', methods=['POST'])
def process_payment():
    data = request.json
    amount = data.get("amount")
    account_id = data.get("account_id")

    # Database logic
    try:
        connection = get_db_connection()
        cursor = connection.cursor()
        query = "INSERT INTO payments (account_id, amount) VALUES (%s, %s)"
        cursor.execute(query, (account_id, amount))
        connection.commit()
        return jsonify({"status": "success", "message": "Payment processed successfully!"}), 201
    except Exception as e:
        return jsonify({"status": "error", "message": str(e)}), 500
    finally:
        connection.close()

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)
