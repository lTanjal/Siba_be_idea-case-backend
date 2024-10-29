import { error } from 'console';
import express, { Request, Response } from 'express';
import { MysqlError } from 'mysql';
import db_knex from '../db/index_knex.js';
import {
  dbErrorHandler,
  requestErrorHandler,
  successHandler,
} from '../responseHandler/index.js';

const city = express.Router();

function handleErrorBasedOnErrno(
  req: Request,
  res: Response,
  error: MysqlError,
  defaultMessage: string,
) {
  switch (error.errno) {
    case 1054:
      requestErrorHandler(req, res, "error in spelling 'name'.");
      break;
    case 1062:
      requestErrorHandler(
        req,
        res,
        `City with the ${req.body.id} already exists!`,
      );
      break;
    default:
      dbErrorHandler(req, res, error, defaultMessage);
      break;
  }
}
//get all cities

city.get('/', (req: Request, res: Response) => {
  db_knex('City')
    .select()
    .then((data) => {
      successHandler(req, res, data, 'Successfully read the cities from DB');
    })
    .catch((err) => {
      dbErrorHandler(req, res, err, 'Error trying to read all cities from DB');
    });
});

// get city by id
city.get('/:id', (req: Request, res: Response) => {
  db_knex('City')
    .select()
    .where('id', req.params.id)
    .then((data) => {
      if (data.length === 1) {
        successHandler(req, res, data, 'Successfully read the city from DB');
      } else {
        requestErrorHandler(
          req,
          res,
          `Failed to fetch city from DB with id: ${req.params.id}`,
        );
      }
    })
    .catch((err) => {
      dbErrorHandler(req, res, err, 'Nothing came through- City');
    });
});

// adding single city

city.post('/', (req: Request, res: Response) => {
  db_knex('City')
    .insert(req.body)
    .into('City')
    .then((idArray) => {
      successHandler(req, res, idArray, 'Adding a city was successfull');
    })
    .catch((error) => {
      handleErrorBasedOnErrno(req, res, error, 'error adding city');
    });
});

// adding single or multiple city
city.post('/multy', (req: Request, res: Response) => {
  db_knex('City')
    .insert(req.body)
    .into('City')
    .then((idArray) => {
      successHandler(
        req,
        res,
        idArray,
        'Adding a city, or multiple cities was seccesfull',
      );
    })
    .catch((error) => {
      handleErrorBasedOnErrno(req, res, error, 'error adding city');
    });
});

//updating city information
city.put('/', (req: Request, res: Response) => {
  if (!req.body.name) {
    requestErrorHandler(req, res, 'City name is missing.');
  } else {
    db_knex('City')
      .where('id', req.body.id)
      .update(req.body)
      .then((rowsAffected) => {
        if (rowsAffected === 1) {
          successHandler(
            req,
            res,
            rowsAffected,
            `Update city successfull! Count of modified rows:${rowsAffected}`,
          );
        } else {
          requestErrorHandler(
            req,
            res,
            `Update city was not successful, ${rowsAffected} row modified`,
          );
        }
      })
      .catch((error) => {
        handleErrorBasedOnErrno(req, res, error, 'error updating city');
      });
  }
});

//delete city by id => DELETE /api/city/1

city.delete('/:id', (req: Request, res: Response) => {
  db_knex('City')
    .where('id', req.params.id)
    .del()
    .then((rowsAffected) => {
      if (rowsAffected === 1) {
        successHandler(
          req,
          res,
          rowsAffected,
          `Delete succesfull! Count of deleted rows: ${rowsAffected}`,
        );
      } else {
        requestErrorHandler(req, res, `Invalid city id: ${req.params.id}`);
      }
    })
    .catch((error) => {
      dbErrorHandler(req, res, error, 'Error deleting category');
    });
});
export default city;
