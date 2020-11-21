document.addEventListener('turbolinks:load', () => {
  const TODAY = new Date(new Date().setHours(0, 0, 0, 0))

  // カレンダーの日本語化
  flatpickr.localize(flatpickr.l10ns.ja)
  // カレンダー表示
  flatpickr('#flatpickr', {
    // スマートフォンでもカレンダーに「flatpickr」を使用
    disableMobile: true,
    // 今日までを選択可能
    maxDate: TODAY
  });
})