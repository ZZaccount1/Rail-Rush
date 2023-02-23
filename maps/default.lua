return {
  version = "1.9",
  luaversion = "5.1",
  tiledversion = "1.9.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 60,
  height = 40,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 8,
  nextobjectid = 172,
  properties = {},
  tilesets = {
    {
      name = "tiles",
      firstgid = 1,
      class = "",
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 4,
      image = "../sprites/tiles.png",
      imagewidth = 64,
      imageheight = 64,
      objectalignment = "unspecified",
      tilerendersize = "tile",
      fillmode = "stretch",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 16
      },
      properties = {},
      wangsets = {},
      tilecount = 16,
      tiles = {}
    },
    {
      name = "props",
      firstgid = 17,
      class = "",
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 5,
      image = "../sprites/props.png",
      imagewidth = 80,
      imageheight = 64,
      objectalignment = "unspecified",
      tilerendersize = "tile",
      fillmode = "stretch",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 16
      },
      properties = {},
      wangsets = {},
      tilecount = 20,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 60,
      height = 40,
      id = 1,
      name = "ground",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
        16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
        16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
        16, 16, 16, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 16, 16, 16,
        16, 16, 16, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 7, 16, 16, 16,
        16, 16, 16, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 7, 16, 16, 16,
        16, 16, 16, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 7, 16, 16, 16,
        16, 16, 16, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 7, 16, 16, 16,
        16, 16, 16, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 7, 16, 16, 16,
        16, 16, 16, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 7, 16, 16, 16,
        16, 16, 16, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 7, 16, 16, 16,
        16, 16, 16, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 7, 16, 16, 16,
        16, 16, 16, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 7, 16, 16, 16,
        16, 16, 16, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 7, 16, 16, 16,
        16, 16, 16, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 7, 16, 16, 16,
        16, 16, 16, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 7, 16, 16, 16,
        16, 16, 16, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 7, 16, 16, 16,
        16, 16, 16, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 7, 16, 16, 16,
        16, 16, 16, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 7, 16, 16, 16,
        16, 16, 16, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 7, 16, 16, 16,
        16, 16, 16, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 7, 16, 16, 16,
        16, 16, 16, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 7, 16, 16, 16,
        16, 16, 16, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 7, 16, 16, 16,
        16, 16, 16, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 7, 16, 16, 16,
        16, 16, 16, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 7, 16, 16, 16,
        16, 16, 16, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 7, 16, 16, 16,
        16, 16, 16, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 7, 16, 16, 16,
        16, 16, 16, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 7, 16, 16, 16,
        16, 16, 16, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 7, 16, 16, 16,
        16, 16, 16, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 7, 16, 16, 16,
        16, 16, 16, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 7, 16, 16, 16,
        16, 16, 16, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 7, 16, 16, 16,
        16, 16, 16, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 7, 16, 16, 16,
        16, 16, 16, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 7, 16, 16, 16,
        16, 16, 16, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 7, 16, 16, 16,
        16, 16, 16, 9, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 11, 16, 16, 16,
        16, 16, 16, 13, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 15, 16, 16, 16,
        16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
        16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
        16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 60,
      height = 40,
      id = 2,
      name = "railway",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 19, 20, 0, 20, 20, 0, 20, 20, 20, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 19, 20, 20, 20, 20, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 29, 20, 20, 20, 0, 20, 20, 20, 21, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 19, 20, 20, 21, 0, 0, 0, 26, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 19, 20, 20, 20, 20, 20, 0, 20, 20, 20, 20, 20, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 26, 0, 0, 0, 26, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 29, 20, 0, 20, 31, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 19, 20, 20, 21, 0, 0, 26, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 26, 0, 0, 26, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 29, 20, 20, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 26, 0, 0, 26, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 19, 20, 20, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 19, 20, 0, 20, 20, 31, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 19, 20, 20, 31, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 26, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 20, 20, 20, 20, 31, 0, 0, 19, 20, 20, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 26, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 26, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 26, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 26, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 29, 20, 20, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 26, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 19, 20, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 29, 20, 20, 20, 21, 0, 0, 0, 26, 0, 0, 26, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 19, 20, 20, 31, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 26, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 29, 20, 21, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 26, 0, 0, 26, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 19, 20, 20, 31, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 29, 20, 20, 20, 20, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 26, 0, 0, 26, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 29, 20, 20, 31, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 19, 20, 0, 20, 20, 31, 0, 0, 0, 0, 19, 20, 0, 20, 21, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 19, 20, 0, 20, 31, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 26, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 26, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 29, 20, 20, 20, 0, 20, 20, 20, 20, 20, 31, 0, 0, 0, 29, 20, 20, 20, 31, 0, 0, 0, 0, 0, 0, 29, 20, 20, 20, 0, 20, 20, 20, 20, 20, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 5,
      name = "entity",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 17,
          name = "Tree",
          class = "tree",
          shape = "rectangle",
          x = 576,
          y = 96,
          width = 16,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 21,
          name = "Tree",
          class = "tree",
          shape = "rectangle",
          x = 208,
          y = 80,
          width = 16,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 18,
          name = "Stone",
          class = "stone",
          shape = "rectangle",
          x = 96,
          y = 128,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 22,
          name = "Tree",
          class = "tree",
          shape = "rectangle",
          x = 704,
          y = 48,
          width = 16,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 23,
          name = "Tree",
          class = "tree",
          shape = "rectangle",
          x = 96,
          y = 192,
          width = 16,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 24,
          name = "Tree",
          class = "tree",
          shape = "rectangle",
          x = 64,
          y = 80,
          width = 16,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 25,
          name = "Tree",
          class = "tree",
          shape = "rectangle",
          x = 304,
          y = 48,
          width = 16,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 26,
          name = "Tree",
          class = "tree",
          shape = "rectangle",
          x = 368,
          y = 112,
          width = 16,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 27,
          name = "Tree",
          class = "tree",
          shape = "rectangle",
          x = 400,
          y = 224,
          width = 16,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 28,
          name = "Tree",
          class = "tree",
          shape = "rectangle",
          x = 352,
          y = 288,
          width = 16,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 29,
          name = "Tree",
          class = "tree",
          shape = "rectangle",
          x = 288,
          y = 384,
          width = 16,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 30,
          name = "Tree",
          class = "tree",
          shape = "rectangle",
          x = 224,
          y = 336,
          width = 16,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 31,
          name = "Tree",
          class = "tree",
          shape = "rectangle",
          x = 384,
          y = 416,
          width = 16,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 32,
          name = "Tree",
          class = "tree",
          shape = "rectangle",
          x = 416,
          y = 336,
          width = 16,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 35,
          name = "Tree",
          class = "tree",
          shape = "rectangle",
          x = 96,
          y = 352,
          width = 16,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 36,
          name = "Tree",
          class = "tree",
          shape = "rectangle",
          x = 160,
          y = 208,
          width = 16,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 37,
          name = "Tree",
          class = "tree",
          shape = "rectangle",
          x = 224,
          y = 240,
          width = 16,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 38,
          name = "Tree",
          class = "tree",
          shape = "rectangle",
          x = 288,
          y = 160,
          width = 16,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 39,
          name = "Tree",
          class = "tree",
          shape = "rectangle",
          x = 64,
          y = 480,
          width = 16,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 40,
          name = "Tree",
          class = "tree",
          shape = "rectangle",
          x = 464,
          y = 432,
          width = 16,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 41,
          name = "Tree",
          class = "tree",
          shape = "rectangle",
          x = 544,
          y = 352,
          width = 16,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 42,
          name = "Tree",
          class = "tree",
          shape = "rectangle",
          x = 496,
          y = 192,
          width = 16,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 43,
          name = "Tree",
          class = "tree",
          shape = "rectangle",
          x = 464,
          y = 80,
          width = 16,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 44,
          name = "Tree",
          class = "tree",
          shape = "rectangle",
          x = 656,
          y = 192,
          width = 16,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 45,
          name = "Tree",
          class = "tree",
          shape = "rectangle",
          x = 736,
          y = 176,
          width = 16,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 46,
          name = "Tree",
          class = "tree",
          shape = "rectangle",
          x = 640,
          y = 352,
          width = 16,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 47,
          name = "Tree",
          class = "tree",
          shape = "rectangle",
          x = 672,
          y = 464,
          width = 16,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 48,
          name = "Tree",
          class = "tree",
          shape = "rectangle",
          x = 736,
          y = 480,
          width = 16,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 49,
          name = "Tree",
          class = "tree",
          shape = "rectangle",
          x = 784,
          y = 304,
          width = 16,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 50,
          name = "Tree",
          class = "tree",
          shape = "rectangle",
          x = 848,
          y = 208,
          width = 16,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 51,
          name = "Tree",
          class = "tree",
          shape = "rectangle",
          x = 864,
          y = 496,
          width = 16,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 52,
          name = "Stone",
          class = "stone",
          shape = "rectangle",
          x = 64,
          y = 240,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 53,
          name = "Stone",
          class = "stone",
          shape = "rectangle",
          x = 80,
          y = 176,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 54,
          name = "Stone",
          class = "stone",
          shape = "rectangle",
          x = 176,
          y = 128,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 55,
          name = "Stone",
          class = "stone",
          shape = "rectangle",
          x = 128,
          y = 80,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 56,
          name = "Stone",
          class = "stone",
          shape = "rectangle",
          x = 352,
          y = 64,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 57,
          name = "Stone",
          class = "stone",
          shape = "rectangle",
          x = 416,
          y = 112,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 58,
          name = "Stone",
          class = "stone",
          shape = "rectangle",
          x = 352,
          y = 208,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 59,
          name = "Stone",
          class = "stone",
          shape = "rectangle",
          x = 320,
          y = 320,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 60,
          name = "Stone",
          class = "stone",
          shape = "rectangle",
          x = 352,
          y = 384,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 61,
          name = "Stone",
          class = "stone",
          shape = "rectangle",
          x = 256,
          y = 416,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 62,
          name = "Stone",
          class = "stone",
          shape = "rectangle",
          x = 288,
          y = 464,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 63,
          name = "Stone",
          class = "stone",
          shape = "rectangle",
          x = 224,
          y = 512,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 64,
          name = "Stone",
          class = "stone",
          shape = "rectangle",
          x = 192,
          y = 384,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 65,
          name = "Stone",
          class = "stone",
          shape = "rectangle",
          x = 576,
          y = 224,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 66,
          name = "Stone",
          class = "stone",
          shape = "rectangle",
          x = 544,
          y = 256,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 67,
          name = "Stone",
          class = "stone",
          shape = "rectangle",
          x = 512,
          y = 432,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 68,
          name = "Stone",
          class = "stone",
          shape = "rectangle",
          x = 512,
          y = 352,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 69,
          name = "Stone",
          class = "stone",
          shape = "rectangle",
          x = 528,
          y = 288,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 70,
          name = "Stone",
          class = "stone",
          shape = "rectangle",
          x = 560,
          y = 432,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 71,
          name = "Stone",
          class = "stone",
          shape = "rectangle",
          x = 496,
          y = 512,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 72,
          name = "Stone",
          class = "stone",
          shape = "rectangle",
          x = 528,
          y = 560,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 73,
          name = "Stone",
          class = "stone",
          shape = "rectangle",
          x = 592,
          y = 512,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 74,
          name = "Stone",
          class = "stone",
          shape = "rectangle",
          x = 704,
          y = 384,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 75,
          name = "Stone",
          class = "stone",
          shape = "rectangle",
          x = 640,
          y = 112,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 76,
          name = "Stone",
          class = "stone",
          shape = "rectangle",
          x = 816,
          y = 96,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 77,
          name = "Stone",
          class = "stone",
          shape = "rectangle",
          x = 800,
          y = 512,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 78,
          name = "Stone",
          class = "stone",
          shape = "rectangle",
          x = 784,
          y = 400,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 79,
          name = "Stone",
          class = "stone",
          shape = "rectangle",
          x = 736,
          y = 304,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 84,
          name = "Empty Railway",
          class = "emptyRailway",
          shape = "rectangle",
          x = 128,
          y = 192,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 85,
          name = "Empty Railway",
          class = "emptyRailway",
          shape = "rectangle",
          x = 208,
          y = 208,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["orientation"] = "h"
          }
        },
        {
          id = 86,
          name = "Empty Railway",
          class = "emptyRailway",
          shape = "rectangle",
          x = 240,
          y = 144,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 87,
          name = "Empty Railway",
          class = "emptyRailway",
          shape = "rectangle",
          x = 320,
          y = 192,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 88,
          name = "Empty Railway",
          class = "emptyRailway",
          shape = "rectangle",
          x = 272,
          y = 288,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 89,
          name = "Empty Railway",
          class = "emptyRailway",
          shape = "rectangle",
          x = 144,
          y = 384,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 90,
          name = "Empty Railway",
          class = "emptyRailway",
          shape = "rectangle",
          x = 176,
          y = 480,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["orientation"] = "h"
          }
        },
        {
          id = 91,
          name = "Empty Railway",
          class = "emptyRailway",
          shape = "rectangle",
          x = 208,
          y = 544,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["orientation"] = "h"
          }
        },
        {
          id = 92,
          name = "Start",
          class = "minecartStart",
          shape = "rectangle",
          x = 64,
          y = 288,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["startOrientation"] = "d"
          }
        },
        {
          id = 93,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 144,
          y = 288,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "w"
          }
        },
        {
          id = 94,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 128,
          y = 144,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "d"
          }
        },
        {
          id = 95,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 192,
          y = 160,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "s"
          }
        },
        {
          id = 96,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 176,
          y = 224,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "d"
          }
        },
        {
          id = 97,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 256,
          y = 208,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "w"
          }
        },
        {
          id = 98,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 240,
          y = 96,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "d"
          }
        },
        {
          id = 99,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 336,
          y = 112,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "s"
          }
        },
        {
          id = 100,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 320,
          y = 272,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "a"
          }
        },
        {
          id = 101,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 256,
          y = 256,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "s"
          }
        },
        {
          id = 102,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 272,
          y = 352,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "a"
          }
        },
        {
          id = 103,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 208,
          y = 336,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "w"
          }
        },
        {
          id = 106,
          name = "Empty Railway",
          class = "emptyRailway",
          shape = "rectangle",
          x = 304,
          y = 528,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 107,
          name = "Empty Railway",
          class = "emptyRailway",
          shape = "rectangle",
          x = 336,
          y = 480,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["orientation"] = "h"
          }
        },
        {
          id = 108,
          name = "Empty Railway",
          class = "emptyRailway",
          shape = "rectangle",
          x = 432,
          y = 464,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 109,
          name = "Empty Railway",
          class = "emptyRailway",
          shape = "rectangle",
          x = 480,
          y = 304,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 110,
          name = "Empty Railway",
          class = "emptyRailway",
          shape = "rectangle",
          x = 528,
          y = 160,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["orientation"] = "h"
          }
        },
        {
          id = 111,
          name = "Empty Railway",
          class = "emptyRailway",
          shape = "rectangle",
          x = 624,
          y = 240,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 112,
          name = "Empty Railway",
          class = "emptyRailway",
          shape = "rectangle",
          x = 576,
          y = 320,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 113,
          name = "Empty Railway",
          class = "emptyRailway",
          shape = "rectangle",
          x = 576,
          y = 368,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 114,
          name = "Empty Railway",
          class = "emptyRailway",
          shape = "rectangle",
          x = 608,
          y = 432,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 115,
          name = "Empty Railway",
          class = "emptyRailway",
          shape = "rectangle",
          x = 576,
          y = 480,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["orientation"] = "h"
          }
        },
        {
          id = 116,
          name = "Empty Railway",
          class = "emptyRailway",
          shape = "rectangle",
          x = 608,
          y = 544,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["orientation"] = "h"
          }
        },
        {
          id = 117,
          name = "Empty Railway",
          class = "emptyRailway",
          shape = "rectangle",
          x = 704,
          y = 496,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 118,
          name = "Empty Railway",
          class = "emptyRailway",
          shape = "rectangle",
          x = 752,
          y = 384,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 119,
          name = "Empty Railway",
          class = "emptyRailway",
          shape = "rectangle",
          x = 688,
          y = 320,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 120,
          name = "Empty Railway",
          class = "emptyRailway",
          shape = "rectangle",
          x = 720,
          y = 256,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["orientation"] = "h"
          }
        },
        {
          id = 121,
          name = "Empty Railway",
          class = "emptyRailway",
          shape = "rectangle",
          x = 816,
          y = 304,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 122,
          name = "Empty Railway",
          class = "emptyRailway",
          shape = "rectangle",
          x = 816,
          y = 416,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 123,
          name = "Empty Railway",
          class = "emptyRailway",
          shape = "rectangle",
          x = 864,
          y = 368,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 124,
          name = "Empty Railway",
          class = "emptyRailway",
          shape = "rectangle",
          x = 864,
          y = 304,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 125,
          name = "Empty Railway",
          class = "emptyRailway",
          shape = "rectangle",
          x = 864,
          y = 256,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 126,
          name = "Empty Railway",
          class = "emptyRailway",
          shape = "rectangle",
          x = 864,
          y = 192,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 127,
          name = "Empty Railway",
          class = "emptyRailway",
          shape = "rectangle",
          x = 800,
          y = 128,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["orientation"] = "h"
          }
        },
        {
          id = 128,
          name = "Empty Railway",
          class = "emptyRailway",
          shape = "rectangle",
          x = 768,
          y = 64,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["orientation"] = "h"
          }
        },
        {
          id = 129,
          name = "Empty Railway",
          class = "emptyRailway",
          shape = "rectangle",
          x = 816,
          y = 64,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["orientation"] = "h"
          }
        },
        {
          id = 130,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 224,
          y = 272,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "a"
          }
        },
        {
          id = 131,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 160,
          y = 288,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "s"
          }
        },
        {
          id = 132,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 176,
          y = 368,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "a"
          }
        },
        {
          id = 133,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 128,
          y = 352,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "s"
          }
        },
        {
          id = 134,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 144,
          y = 448,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "d"
          }
        },
        {
          id = 135,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 240,
          y = 432,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "s"
          }
        },
        {
          id = 136,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 224,
          y = 496,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "a"
          }
        },
        {
          id = 137,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 128,
          y = 480,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "s"
          }
        },
        {
          id = 138,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 144,
          y = 560,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "d"
          }
        },
        {
          id = 139,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 320,
          y = 544,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "w"
          }
        },
        {
          id = 140,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 304,
          y = 464,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "d"
          }
        },
        {
          id = 141,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 384,
          y = 480,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "s"
          }
        },
        {
          id = 142,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 368,
          y = 560,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "d"
          }
        },
        {
          id = 143,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 448,
          y = 544,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "w"
          }
        },
        {
          id = 144,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 432,
          y = 368,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "d"
          }
        },
        {
          id = 145,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 496,
          y = 384,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "w"
          }
        },
        {
          id = 146,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 480,
          y = 224,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "a"
          }
        },
        {
          id = 147,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 416,
          y = 240,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "w"
          }
        },
        {
          id = 148,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 432,
          y = 144,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "d"
          }
        },
        {
          id = 149,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 640,
          y = 160,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "s"
          }
        },
        {
          id = 150,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 624,
          y = 288,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "a"
          }
        },
        {
          id = 151,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 560,
          y = 272,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "s"
          }
        },
        {
          id = 152,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 576,
          y = 416,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "d"
          }
        },
        {
          id = 153,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 624,
          y = 400,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "s"
          }
        },
        {
          id = 154,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 608,
          y = 496,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "a"
          }
        },
        {
          id = 155,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 528,
          y = 480,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "s"
          }
        },
        {
          id = 156,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 544,
          y = 560,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "d"
          }
        },
        {
          id = 157,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 720,
          y = 544,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "w"
          }
        },
        {
          id = 158,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 704,
          y = 400,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "d"
          }
        },
        {
          id = 159,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 768,
          y = 416,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "w"
          }
        },
        {
          id = 160,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 752,
          y = 336,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "a"
          }
        },
        {
          id = 161,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 672,
          y = 352,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "w"
          }
        },
        {
          id = 162,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 688,
          y = 240,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "d"
          }
        },
        {
          id = 163,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 784,
          y = 256,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "w"
          }
        },
        {
          id = 164,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 768,
          y = 192,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "d"
          }
        },
        {
          id = 165,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 832,
          y = 208,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "s"
          }
        },
        {
          id = 166,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 816,
          y = 464,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "d"
          }
        },
        {
          id = 167,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 880,
          y = 448,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "w"
          }
        },
        {
          id = 168,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 864,
          y = 112,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "a"
          }
        },
        {
          id = 169,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 720,
          y = 128,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "w"
          }
        },
        {
          id = 170,
          name = "Railway Trigger",
          class = "railwayTrigger",
          shape = "rectangle",
          x = 736,
          y = 48,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["newOrientation"] = "d"
          }
        },
        {
          id = 171,
          name = "End",
          class = "minecartEnd",
          shape = "rectangle",
          x = 864,
          y = 64,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 6,
      name = "solid",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 1,
          name = "",
          class = "",
          shape = "rectangle",
          x = 0,
          y = 0,
          width = 960,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 2,
          name = "",
          class = "",
          shape = "rectangle",
          x = 912,
          y = 48,
          width = 48,
          height = 592,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 3,
          name = "",
          class = "",
          shape = "rectangle",
          x = 0,
          y = 576,
          width = 912,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 104,
          name = "",
          class = "",
          shape = "rectangle",
          x = 0,
          y = 48,
          width = 48,
          height = 528,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
