import mysql from 'mysql';
import util from 'util';

const masterConnection = mysql.createConnection({
  host: "127.0.0.1",
  user: "mydb_user",
  password: "mydb_pwd",
  port: 4406,
  database: "mydb",
});

const slaveConnection = mysql.createConnection({
  host: "127.0.0.1",
  user: "mydb_slave_user",
  password: "mydb_slave_pwd",
  port: 5506,
  database: "mydb",
});

export async function master(query,id) {
    const masterQuery = util.promisify(masterConnection.query).bind(masterConnection);
    const masterResults = await masterQuery(query, [id]);
    console.log(masterResults);
    // const masterCommit = util.promisify(masterConnection.commit).bind(masterConnection);
  
    return masterResults
  
}