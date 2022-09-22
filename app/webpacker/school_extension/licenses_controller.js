import { Controller } from 'stimulus';
import $ from 'jquery';

export default class extends Controller {
  static targets = ['licenseDropdown', 'planItem', 'activePlanInput', 'copyEmailBtn'];

  licenseDropdownSelected(event) {
    event.stopPropagation();
  }

  planSelected(event) {
    let parent;
    if ($(event.target).hasClass('plan-panel')) {
      parent = event.target;
    } else {
      parent = $(event.target).parents('.plan-panel')[0];
    }
    $('.active_check').removeClass('active');
    $(parent).find('.active_check').addClass('active');
    $(this.activePlanInputTarget).val(parent.dataset.value);
  }

  copyEmail(event) {
    const text = event.innerText;
    const elem = document.createElement('textarea');
    const copiedText = $(event.target).data('val');
    document.body.appendChild(elem);
    elem.value = text;
    elem.select();
    document.execCommand('copy');
    document.body.removeChild(elem);
    $(event.target).attr('data-original-title', copiedText);
  }
}
