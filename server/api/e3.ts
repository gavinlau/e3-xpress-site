export default defineEventHandler((event) => {
  // https://www.bilibili.com/video/BV1MW4y1V7Fr/
  // const age=event.context.params?.age//api/abc/12
  // const query=getQuery(event)//?name=zs&age=12
  // const body=await readBody(event)

  // useFetch('api/ddd',{
  //     method:'post',
  //     body:{account:'jiangsu',password:'111'}
  // }).then(res=>{
  //     console.log(res)
  // })
  // test.get.ts test.post.ts

  // [...].ts

  // useRuntimeConfig()
  // const cookies=parseCookies(event)

  // nested router
  // const router=createRouter()
  // router.get('/abc',()=>'hello world')
  // export default router

  // event.node.res.end('Hello world')
  return {
    title: 'Mount Everest',
    description: 'Mount Everest is Earth\'s highest mountain above sea level, located in the Mahalangur Himal sub-range of the Himalayas. The China–Nepal border runs across its summit point',
    height: '8,848 m',
    countries: [
      'China',
      'Nepal',
    ],
    continent: 'Asia',
    image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Everest_kalapatthar.jpg/600px-Everest_kalapatthar.jpg',
    dir: '/mountains',
    path: '/mountains/mount-everest',
    slug: 'mount-everest',
    updatedAt: '2020-12-11T15:40:35.000Z',
  }
})
