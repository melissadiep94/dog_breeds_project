from flask import Flask, render_template, request,jsonify
import pandas as pd
import datetime
import json
import psycopg2
from flask import Flask

app = Flask(__name__)

def get_table(table):
    conn = psycopg2.connect(
    database='postgresql://postgres:{password}@localhost:5432/pets_db'
    )
    if "pet" in table or "char" in table:
        return False
    conn.autocommit = True
    cursor = conn.cursor()
    cursor.execute('''SELECT * from '''+table)
    result = cursor.fetchone()
    result = cursor.fetchall()
    # print(result)
    conn.commit()
    conn.close()
    return result
def get_breed():
    conn = psycopg2.connect(
    database='postgresql://postgres:{password}@localhost:5432/pets_db'
    )
    conn.autocommit = True
    cursor = conn.cursor()
    cursor.execute('''SELECT * from breeds''')
    result = cursor.fetchone()
    result = cursor.fetchall()
    # print(result)
    conn.commit()
    conn.close()
    return result
@app.route('/')
def dropdown():
    table = ['breeds', 'lifespan', 'weight', 'pet_finder']
    data=get_breed()
    table={"table":table,"data":data,"len":len(data)}
    return render_template('test.html', data=table)

@app.route('/breed/<table>')
def breed(table):
    data=get_table(table)
    if data:
        return jsonify({'data':data})
    else:
        return jsonify({"data":False})
@app.route('/breedname/<name>')
def breedname(name):
    conn = psycopg2.connect(
    database='postgresql://postgres:{password}@localhost:5432/pets_db'
    )
    conn.autocommit = True
    cursor = conn.cursor()
    cursor.execute('''SELECT * from breeds where breed_name =\''''+name+'\'')
    print('''SELECT * from breeds where breed_name =\''''+name+'\'')
    result = cursor.fetchone()
    print(result)
    conn.commit()
    conn.close()
    data={"breed_type":result[1],"breed_id":result[0],"breed_name":result[2]}
    return jsonify(data)
@app.route('/graphc/<table>')
def graph_table(table):
    import plotly
    import plotly.express as px
    data=get_table(table)
    data1=[]
    data2=[]
    for i in data:
        data1.append(i[1])
        data2.append(i[2])
    if data3 and country:
        date=[]
        for i in data3['data']['Date']:
            date.append(i)
        Confirmed=[]
        for i in data3['data']['Confirmed']:
            Confirmed.append(int(i))
    df = pd.DataFrame({
      "date": data1,
      "Confirmed":  data2})
    fig=px.line(df, x='col 1' , y='col 2', title="Graph "+table)
    graphJSON = json.dumps(fig, cls=plotly.utils.PlotlyJSONEncoder)
       
    return graphJSON
app.run(debug=True)