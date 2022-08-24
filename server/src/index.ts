import 'reflect-metadata';
import express, {Express} from 'express';
import {ApolloServer} from 'apollo-server-express';
import { HelloResolver } from './resolvers/test';
import { buildSchema } from 'type-graphql';
import { ApolloServerPluginLandingPageGraphQLPlayground } from 'apollo-server-core';


const main = async () => {
  const apolloServer = new ApolloServer({
    schema: await buildSchema({
      resolvers: [HelloResolver],
      validate: false,
    }),
    plugins: [ApolloServerPluginLandingPageGraphQLPlayground()]
  })

  await apolloServer.start()
  const app: Express = express();
  
  apolloServer.applyMiddleware({app})

  app.get("/", (_req, res) => {
    res.send("hello")
  });
  
  const PORT = process.env.PORT || 4000;
  app.listen(PORT, () => console.log(`server started at port ${PORT}`))
}


main().catch((err) => {
  console.error(err);
})
