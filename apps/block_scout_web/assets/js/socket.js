import { Socket } from 'phoenix'
import { locale } from './locale'

let websocketRootUrl = process.env.SOCKET_ROOT
if (!websocketRootUrl) {
  websocketRootUrl = ''
}
if (websocketRootUrl.endsWith('/')) {
  websocketRootUrl = websocketRootUrl.slice(0, -1)
}

const socket = new Socket(websocketRootUrl + '/socket', { params: { locale } })
socket.connect()

export default socket

/**
*在給定主題的頻道中訂閱客戶端。
 *
 *此函數將在創建頻道之前檢查頻道是否已經存在。這很有用，因為
 *當客戶端試圖創建重複訂閱時，服務器將關閉
 *現有訂閱並創建一個新訂閱。
 *
 *在 https://hexdocs.pm/phoenix/js/#phoenix 中查看更多相關信息。
 *
 *返回一個 Channel 實例。
 */
export function subscribeChannel (topic) {
  const channel = socket.channels.find(channel => channel.topic === topic)

  if (channel) {
    return channel
  } else {
    const channel = socket.channel(topic, {})
    channel.join()
    return channel
  }
}
